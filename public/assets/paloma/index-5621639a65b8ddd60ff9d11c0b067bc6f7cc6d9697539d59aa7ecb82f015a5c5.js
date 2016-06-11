window.Paloma = window.Paloma || {};

//
// Do nothing if there is no available console.
//
if ( !window['console'] ){
  Paloma.log = Paloma.warn = function(msg){};
}
else {
  Paloma.warn = function(msg){
    if (Paloma.env != 'development'){ return; }
    console.warn(msg);
  };

  Paloma.log = function(msg){
    if (Paloma.env != 'development'){ return; }
    console.log(msg);
  };
}


if ( !window['Paloma'] ){
  if ( !window['console'] ){
    console.warn("Paloma not found. Require it in your application.js.");
  }
}
;
Paloma.BaseController = function(params){
  this.params = params;
};

Paloma.BaseController.prototype = {
  before: []
};

Paloma.ControllerClassFactory = function(){
  this._controllers = {};
  this._inheritanceSymbol = '<';
};

Paloma.ControllerClassFactory.prototype = {

  make: function(controllerAndParent, prototype){
    var parts = this._extractParts(controllerAndParent),
        controller = this._getOrCreate( parts.controller );

    this._updatePrototype(controller, prototype);
    this._updateParent(controller, parts.parent);

    return controller;
  },

  get: function(name){
    return this._controllers[name] || null;
  },

  _updateParent: function(controller, parent){
    if (!parent) return;

    var parentClass = this.get(parent);
    if (parentClass) controller.prototype.__proto__ = parentClass.prototype;
  },

  _updatePrototype: function(controller, newPrototype){
    for (var k in newPrototype)
      if (newPrototype.hasOwnProperty(k))
        controller.prototype[k] = newPrototype[k];
  },

  _getOrCreate: function(name){
    return this.get(name) || this._create(name);
  },

  _create: function(name){
    var controller = function(params){
      Paloma.BaseController.call(this, params);
    };

    controller.prototype.__proto__ = Paloma.BaseController.prototype;

    this._controllers[name] = controller;
    return controller;
  },

  _extractParts: function(controllerAndParent){
    var parts = controllerAndParent.split( this._inheritanceSymbol );

    var controller = parts[0].trim(),
        parent = parts[1];

    if (parent) parent = parent.trim();

    return {controller: controller, parent: parent};
  }

};
Paloma.BeforeCallbackPerformer = function(controller){
  this.controller = controller;
  this.entries = controller.before;
  this.action = null;
};

Paloma.BeforeCallbackPerformer.prototype = {

  perform: function(action){
    this.action = action;
    this._executeCallbacks();
  },

  _executeCallbacks: function(){
    for (var i = 0, n = this._callbacks().length; i < n; i++)
      this._executeCallback( this._callbacks()[i] );
  },

  _executeCallback: function(name){
    var callback = this.controller[name];
    if (callback) callback.call(this.controller);
  },

  _callbacks: function(){
    if (this._callbackList) return this._callbackList;

    this._callbackList = [];

    for (var i = 0, n = this.entries.length; i < n; i++){
      var entry = this.entries[i];

      this._callbackList =
        this._callbackList.concat( this._getCallbacksIfForAction(entry) );
    }

    return this._callbackList;
  },

  _getCallbacksIfForAction: function(entry){
    var parsedEntry = this._parseEntry(entry);

    if (
      this._actionIsOn(parsedEntry.actions) ||
      this._allIsOn(parsedEntry.actions)
    )
      return parsedEntry.callbacks;

    return [];
  },

  _actionIsOn: function(actions){
    return actions.indexOf(this.action) != -1;
  },

  _allIsOn: function(actions){
    return actions.indexOf('all') != -1;
  },

  _parseEntry: function(entry){
    var parts = entry.split('->'),
        data = {actions: [], callbacks: []};

    if (parts[0]) data.actions = parts[0].trim().split(' ');
    if (parts[1]) data.callbacks = parts[1].trim().split(' ');

    return data;
  }

};
Paloma.ControllerBuilder = function(classFactory){
  this.classFactory = classFactory;
  this.options = {};
};

Paloma.ControllerBuilder.prototype = {

  build: function(options){
    this.options = options;

    var ControllerClass = this._controllerClass();
    if ( !ControllerClass ) return null;

    var controller = new ControllerClass( this._buildParams() );

    controller.controller = this.options.controller;
    controller.action = this.options.action;

    return controller;
  },

  _controllerClass: function(){
    return this.classFactory.get( this.options.controller );
  },

  _buildParams: function(){
    var params = {};

    for (var k in this.options.params)
      if (this.options.params.hasOwnProperty(k))
        params[k] = this.options.params[k];

    return params;
  }

};
Paloma.Engine = function(controllerBuilder){
  this.controllerBuilder = controllerBuilder;
  this._clearRequest();
};

Paloma.Engine.prototype = {

  setRequest: function(options){
    this._request = {
      id: options.id,
      controller: options.resource,
      action: options.action,
      params: options.params,
      executed: false
    };
  },

  hasRequest: function(){
    return this._request != null;
  },

  lastRequest: function(){
    return this._lastRequest = this._lastRequest || {executed: false};
  },

  start: function(){
    if ( this._shouldStop() ) return;

    this._logRequest();
    this._lastRequest = this._request;

    this._executeControllerAction();
    this._clearRequest();
  },

  _executeControllerAction: function(){
    var controller = this._buildController();
    if (!controller) return;

    var callbackPerformer = new Paloma.BeforeCallbackPerformer(controller);
    callbackPerformer.perform( this._request.action );

    var method = controller[ this._request.action ];
    if (method) method.call(controller);

    this._lastRequest.executed = true;
  },

  _buildController: function(){
    return this.controllerBuilder.build({
      controller: this._request.controller,
      action: this._request.action,
      params: this._request.params
    });
  },

  _shouldStop: function(){
    if ( !this.hasRequest() ) return true;
    if ( this._request.id == this.lastRequest().id ) return true;

    return false;
  },

  _logRequest: function(){
    Paloma.log(
      'Paloma: ' + this._request.controller + '#' +
      this._request.action + ' with params:'
    );

    Paloma.log( this._request.params );
  },

  _clearRequest: function(){
    this._request = null;
  }

};
(function(Paloma){

  var classFactory = new Paloma.ControllerClassFactory(),
      controllerBuilder = new Paloma.ControllerBuilder(classFactory),
      engine = new Paloma.Engine(controllerBuilder)

  Paloma._controllerClassFactory = classFactory;
  Paloma._controllerBuilder = controllerBuilder
  Paloma.engine = engine;

  Paloma.controller = function(name, prototype){
    return classFactory.make(name, prototype);
  };

  Paloma._executeHook = function(){
    var hook = document.querySelector('.js-paloma-hook script');
    if (hook) eval(hook.innerHTML);
  };

  Paloma.start = function(){
    if ( !engine.hasRequest() ) this._executeHook();
    if ( engine.hasRequest() ) engine.start();
  };

  Paloma.isExecuted = function(){
    return engine.lastRequest().executed;
  };

})(window.Paloma);







