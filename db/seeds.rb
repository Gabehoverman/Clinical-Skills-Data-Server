# This file should contain all the record creation needed to seed the database with its default values.
# The api can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# System
musculoskeletal = System.create(name: 'Musculoskeletal', details: 'The complete musculoskeletal exam contains 5 parts, which must be applied to each joint/region that you are examining')
eye             = System.create(name: 'Eye', details: 'Eye')

# Component
cervical_spine  = Component.create(system: musculoskeletal, name: 'Cervical Spine', inspection: 'Begin inspection as the patient enters the examining room. Does the patient’s head move naturally with their body movements? If they hold their head stiffly to one side it could be to protect an area of pain. The neck region should then be inspected for any abnormalities such as blisters, scars and discoloration.', notes: '')
lumbar_spine    = Component.create(system: musculoskeletal, name: 'Lumbar Spine', inspection: 'Anterior, posterior, lateral aspects of patient’s posture, ability to stand erect, symmetry, lordosis, discoloration, swelling, masses, muscular hypertrophy, atrophy, or spasms.', notes: '')
shoulder        = Component.create(system: musculoskeletal, name: 'Shoulder', inspection: 'Notice any deformity, swelling, and asymmetry.  Remember to inspect the clavicle, the deltoids, and the scapula.  Notice whether the spine is straight, while looking for a lateral curvature (scoliosis).  Remember that this is considered a ball-and-socket joint.', notes: '')
elbow           = Component.create(system: musculoskeletal, name: 'Elbow', inspection: 'Notice whether or not the patient has any deviations of the carrying angle between the humerus and the radius while the arm is passively extended with the palm forward.  Normally, the carrying angle is between 5 and 15 laterally (men usually have about a 5 carrying angle, while women usually have around a 15 carrying angle). The elbow is also classified as a hinge joint. Look for any swelling of the olecranon bursa or presence of nodules', notes: '')
wrist_and_hand  = Component.create(system: musculoskeletal, name: 'Wrist and Hand', inspection: 'Inspect the hand for any masses, lesions, nodules, discolorations, contour, position, shape, and completeness of the digits. Inspect both the palmar creases.  Remember to inspect both the palmar and dorsal surfaces of the hand.  Inspect the fingernails for spooning or clubbing', notes: '')
hip             = Component.create(system: musculoskeletal, name: 'Hip', inspection: 'Examine the hip while the patient is walking, standing, and lying down.  Remember that this is considered a ball-and-socket joint and that movement is allowed in all planes', notes: '')
knee            = Component.create(system: musculoskeletal, name: 'Hip', inspection: 'Observe the lower leg alignment.  The angle between the femur and the tibia is expected to be about 15°.  This is considered a hinge joint, thus flexion and extension are both allowed. Variations: Genu valgum (or valgus):  “Knock knees"; Genu varus (or varum):  “Bowlegged"; Genu recurvatum:  Excessive hyperextension of the knee with weight bearing; may indicate weakness of the quadriceps muscles', notes: '')
ankle_foot      = Component.create(system: musculoskeletal, name: 'Ankle/Foot', inspection: 'Examine the patient standing, walking, and then sitting.  Examine for swelling, deformities, number and position of toes, straightness, flatness, and proportion of toes when compared to the other foot.  Lastly, this is considered a hinge joint.', notes: 'Variations: Pes cavus:  Abnormally high arch; Pes planus:  Arch flatter than normal; Pes varus:  In toeing; Pes valgus:  Out toeing')

# Palpation
Palpation.create(component: cervical_spine, structure: 'Hyoid Bone', details: 'C3 Vertebra', notes: 'Anterior')
Palpation.create(component: cervical_spine, structure: 'Thyroid Cartilage', details: 'C4-C5 Vertebrae', notes: 'Anterior')
Palpation.create(component: cervical_spine, structure: 'First Cricoid Ring', details: 'C6 Vertebra', notes: 'Anterior')
Palpation.create(component: cervical_spine, structure: 'Sternocleidomastoid Muscle', details: 'Compare left to right for tenderness, masses, etc.', notes: 'Anterior soft tissue')
Palpation.create(component: cervical_spine, structure: 'Occiput', details: '', notes: 'Posterior')
Palpation.create(component: cervical_spine, structure: 'Mastoid Processes', details: '', notes: 'Posterior')
Palpation.create(component: cervical_spine, structure: 'Spinous Processes', details: '', notes: 'Posterior')
Palpation.create(component: cervical_spine, structure: 'Trapezius Muscle', details: 'Compare left to right for tenderness, masses, etc.', notes: 'Posterior soft tissue')

Palpation.create(component: lumbar_spine, structure: 'Spinous Processes', details: '', notes: '')
Palpation.create(component: lumbar_spine, structure: 'Sacral base', details: '', notes: '')
Palpation.create(component: lumbar_spine, structure: 'Paraspinal Muscles', details: '', notes: '')
Palpation.create(component: lumbar_spine, structure: 'Supraspinous Ligament', details: 'Connects the spinous processes from the 7th cervical vertebra to the sacrum', notes: 'May be palpated over the lumbar vertebrae')
Palpation.create(component: lumbar_spine, structure: 'Interspinous Ligaments', details: 'Connect adjoining spinous processes', notes: '')
Palpation.create(component: lumbar_spine, structure: 'Anterior abdominal wall muscles', details: 'Key in lumbar spine support; weakness results in increased lumbar lordosis', notes: '')

Palpation.create(component: shoulder, structure: 'Suprasternal notch', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Sternoclavicular joint', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Clavicle', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Coracoid process', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Acromioclavicular articulation', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Acromion', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Greater tuberosity of the humerus', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Bicipital groove', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Spine of the scapula (at level of T3)', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Vertebral border of the scapula', details: 'Bony Palpation', notes: '')
Palpation.create(component: shoulder, structure: 'Rotator cuff (SItS muscles)', details: 'Soft Tissue Palpation of Scapular Area', notes: 'Supraspinatus, Infraspinatus, teres minor, Subscapularis')
Palpation.create(component: shoulder, structure: 'Prominent muscles of the shoulder girdle', details: 'Soft Tissue Palpation of Scapular Area', notes: 'Deltoid, Biceps brachii, Triceps')

Palpation.create(component: elbow, structure: 'Elbow', details: 'Bony Palpation', notes: 'Palpate the elbow for any swelling, masses, tenderness, and nodules')
Palpation.create(component: elbow, structure: 'Medial epicondyle of the humerus', details: 'Landmark', notes: '')
Palpation.create(component: elbow, structure: 'Olecranon', details: 'Landmark', notes: '')
Palpation.create(component: elbow, structure: 'Ulnar border', details: 'Landmark', notes: '')
Palpation.create(component: elbow, structure: 'Lateral epicondyle of the humerus', details: 'Landmark', notes: '')
Palpation.create(component: elbow, structure: 'Radial head', details: 'Landmark', notes: '')
Palpation.create(component: elbow, structure: 'Ulnar Nerve', details: 'Soft Tissue Palpation', notes: 'This runs between the medial epicondyle and the olecranon.  When this spot is struck, many times people express that they have “hit their funny bone')
Palpation.create(component: elbow, structure: 'Lymph nodes (epitrochlear)', details: 'Soft Tissue Palpation', notes: 'These lie on the inside of the upper arm, just above the elbow.  If there is clinical evidence of an infection distal to the elbow, it makes sense to feel for these nodes as they are part of the drainage pathway.  To examine, cup the patient\'s elbow in your hand and palpate just above the elbow and along the inside of the upper arm.  When inflamed, the nodes become large and tender (not palpable in healthy individuals).')
Palpation.create(component: elbow, structure: 'Olecranon bursa', details: 'Soft Tissue Palpation', notes: 'This overlies the olecranon and is usually only significantly palpable when inflamed')
Palpation.create(component: elbow, structure: 'Brachial artery', details: 'Soft Tissue Palpation', notes: 'Lies on the medial side of the biceps')

Palpation.create(component: wrist_and_hand, structure: 'Radial styloid', details: 'Bony Palpation', notes: '')
Palpation.create(component: wrist_and_hand, structure: 'Ulnar styloid', details: 'Bony Palpation', notes: '')
Palpation.create(component: wrist_and_hand, structure: 'Anatomic snuffbox', details: 'Bony Palpation', notes: 'This is bound by the extensor pollicis brevis, extensor pollicis longus, and the abductor pollicis longus. Tenderness in the anatomic snuff box is suggestive of a scaphoid fracture')
Palpation.create(component: wrist_and_hand, structure: 'Carpal bones', details: 'Bony Palpation', notes: '')
Palpation.create(component: wrist_and_hand, structure: 'Metacarpals', details: 'Bony Palpation', notes: '')
Palpation.create(component: wrist_and_hand, structure: 'Metacarpophalangeal joints', details: 'Bony Palpation', notes: '')
Palpation.create(component: wrist_and_hand, structure: 'Phalanges', details: 'Bony Palpation', notes: '')
Palpation.create(component: wrist_and_hand, structure: 'Ganglion cyst', details: 'Soft Tissue Palpation', notes: 'This is a cystic enlargement from joint capsules and tendon sheaths (usually on the dorsum of the wrist)')
Palpation.create(component: wrist_and_hand, structure: 'Heberde\'s node', details: 'Soft Tissue Palpation', notes: 'Enlargement of DIP joint due to inflammation in osteoarthritis')
Palpation.create(component: wrist_and_hand, structure: 'Bouchard\'s node', details: 'Soft Tissue Palpation', notes: 'Enlargement of PIP joint due to inflammation in osteoarthritis')
Palpation.create(component: wrist_and_hand, structure: 'Swan neck deformity', details: 'Soft Tissue Palpation', notes: 'Commonly seen with rheumatoid arthritis: Results from shortening of the interossous muscles, which results in Flexion of MCP joints, Hyperextension of PIP joints, Flexion of DIP joints')
Palpation.create(component: wrist_and_hand, structure: 'Boutonniere deformity', details: 'Soft Tissue Palpation', notes: 'Commonly seen with rheumatoid arthritis: Results from flexion of PIP joints with hyperextension of DIP joints')

Palpation.create(component: hip, structure: 'Anterior superior iliac spine (ASIS)', details: 'Anterior Palpation', notes: '')
Palpation.create(component: hip, structure: 'Iliac crest', details: 'Anterior Palpation', notes: '')
Palpation.create(component: hip, structure: 'Greater trochanter of femur', details: 'Anterior Palpation', notes: 'Contents of Femoral triangle:  Femoral nerve (lateral), femoral artery, femoral vein (medial) - NAVEL (nerve, artery, vein, empty space, lymphatics); the artery is easily palpable')
Palpation.create(component: hip, structure: 'Posterior superior iliac spine (PSIS)', details: 'Posterior Palpation', notes: '')
Palpation.create(component: hip, structure: 'Sacroiliac joint (S2 is the midpoint of the sacroiliac joint)', details: 'Posterior Palpation', notes: 'Sciatic nerve - located under the cover of the piriformis muscle and passes midway between the greater trochanter and the ischial tuberosity.  Make sure all injections go into the upper outer quadrant of the buttock. Piriformis muscle - halfway between the greater trochanter and the middle of the sacrum.  This point is used for counterstrain')

Palpation.create(component: knee, structure: 'Medial and lateral tibial plateaus (condyles)', details: '', notes: '')
Palpation.create(component: knee, structure: 'Tibial tubercle', details: 'Osgood Schlatter Disease:  Osteochondritis of the epiphysis of the tibial tubercle (hypertrophy over the tibial tubercle; confirmed with x-ray)', notes: '')
Palpation.create(component: knee, structure: 'Medial and lateral femoral condyles', details: '', notes: '')
Palpation.create(component: knee, structure: 'Head of fibula', details: 'Fibular head is situated at about the same level as the tibial tubercle', notes: '')
Palpation.create(component: knee, structure: 'Patella', details: '', notes: '')
Palpation.create(component: knee, structure: 'Infrapatellar tendon', details: '', notes: '')
Palpation.create(component: knee, structure: 'Bursae', details: 'Will not be palpable on healthy patients', notes: '')
Palpation.create(component: knee, structure: 'Popliteal artery', details: 'Runs in the popliteal fossa in the posterior aspect of the knee', notes: '')
Palpation.create(component: knee, structure: 'Baker\'s cyst', details: 'Usually a cyst of inflammatory fluid found in the popliteal fossa.  It may be responsible for swelling in the popliteal fossa, which may cause calf pain', notes: '')

Palpation.create(component: ankle_foot, structure: 'Talus', details: 'Medial Aspect of the Foot', notes: '')
Palpation.create(component: ankle_foot, structure: 'Navicular', details: 'Medial Aspect of the Foot', notes: '')
Palpation.create(component: ankle_foot, structure: 'First (medial) cuneiform', details: 'Medial Aspect of the Foot', notes: '')
Palpation.create(component: ankle_foot, structure: 'Calcaneus', details: 'Lateral Aspect', notes: '')
Palpation.create(component: ankle_foot, structure: 'Cuboid', details: 'Lateral Aspect', notes: '')
Palpation.create(component: ankle_foot, structure: '5th metatarsal', details: 'Lateral Aspect', notes: '')
Palpation.create(component: ankle_foot, structure: 'Sesamoid bones', details: 'Plantar Surface', notes: '')
Palpation.create(component: ankle_foot, structure: 'Metatarsal heads', details: 'Plantar Surface', notes: '')
Palpation.create(component: ankle_foot, structure: 'Heel spur', details: 'Plantar Surface', notes: '')
Palpation.create(component: ankle_foot, structure: 'Bunion', details: 'Pressure irritation over the medial eminence of the first metatarsophalangeal joint from shoe irritation', notes: '')
Palpation.create(component: ankle_foot, structure: 'March fracture', details: 'Tenderness over proximal tip of 5th metatarsal due to a stress fracture from excess walking, marching, and/or running', notes: '')
Palpation.create(component: ankle_foot, structure: 'Dorsalis pedis artery', details: 'Located over medial aspect of the dorsum of foot', notes: '')
Palpation.create(component: ankle_foot, structure: 'Posterior tibial artery', details: 'Located posteriorly and inferiorly below the medial malleolus', notes: '')
Palpation.create(component: ankle_foot, structure: 'Insertion of Achilles tendon', details: 'Combined with tendon of the gastrocnemius and the soleus muscles', notes: '')

# Range of Motion
RangeOfMotion.create(component: cervical_spine, motion: 'Flexion', degrees: '50', notes: 'Touch chin to chest')
RangeOfMotion.create(component: cervical_spine, motion: 'Extension', degrees: '60', notes: 'Look at ceiling directly above')
RangeOfMotion.create(component: cervical_spine, motion: 'Side Bending', degrees: '45', notes: 'Touch ear to shoulder without moving shoulder')
RangeOfMotion.create(component: cervical_spine, motion: 'Rotation', degrees: '80', notes: 'Chin nearly inline with shoulder')

RangeOfMotion.create(component: lumbar_spine, motion: 'Flexion', degrees: '75-90', notes: '')
RangeOfMotion.create(component: lumbar_spine, motion: 'Extension', degrees: '30', notes: '')
RangeOfMotion.create(component: lumbar_spine, motion: 'Lateral Bending', degrees: '35', notes: '')
RangeOfMotion.create(component: lumbar_spine, motion: 'Rotation', degrees: '30', notes: '')

RangeOfMotion.create(component: shoulder, motion: 'Abduction', degrees: '180', notes: '')
RangeOfMotion.create(component: shoulder, motion: 'Adduction', degrees: '50', notes: '')
RangeOfMotion.create(component: shoulder, motion: 'Flexion', degrees: '180', notes: '')
RangeOfMotion.create(component: shoulder, motion: 'Extension', degrees: '50', notes: '')
RangeOfMotion.create(component: shoulder, motion: 'Internal Rotation', degrees: '90', notes: '')
RangeOfMotion.create(component: shoulder, motion: 'External Rotation', degrees: '90', notes: '')
RangeOfMotion.create(component: shoulder, motion: 'Glenohumeral vs. Scapulothoracic', degrees: '', notes: 'Normally, glenohumeral is a 2:1 ratio to scapulothoracic in shoulder movement. Frozen shoulder occurs when there is NO glenohumeral motion (only scapulothoracic motion).')

RangeOfMotion.create(component: elbow, motion: 'Flexion', degrees: '150-160', notes: '')
RangeOfMotion.create(component: elbow, motion: 'Extension', degrees: '0/-5', notes: 'Anatomical position is used for this value')
RangeOfMotion.create(component: elbow, motion: 'Supination', degrees: '90', notes: '')
RangeOfMotion.create(component: elbow, motion: 'Pronation', degrees: '90', notes: '')

RangeOfMotion.create(component: elbow, motion: 'Flexion', degrees: '80', notes: 'Wrist')
RangeOfMotion.create(component: elbow, motion: 'Extension', degrees: '70', notes: 'Wrist')
RangeOfMotion.create(component: elbow, motion: 'Ulnar deviation', degrees: '55', notes: 'Wrist')
RangeOfMotion.create(component: elbow, motion: 'Radial deviation', degrees: '20', notes: 'Wrist')
RangeOfMotion.create(component: elbow, motion: 'Flexion', degrees: '90', notes: 'Fingers. Testing at the MCP, PIP, and DIP joints')
RangeOfMotion.create(component: elbow, motion: 'Extension', degrees: '20-30', notes: 'Fingers. Testing at the MCP, PIP, and DIP joints')
RangeOfMotion.create(component: elbow, motion: 'Abduction', degrees: '20', notes: 'Fingers. Instruct patient to spread his fingers apart')
RangeOfMotion.create(component: elbow, motion: 'Adduction', degrees: '0', notes: 'Fingers. Bring fingers back together again')
RangeOfMotion.create(component: elbow, motion: 'Flexion', degrees: '50', notes: 'Thumb')
RangeOfMotion.create(component: elbow, motion: 'Extension', degrees: '0', notes: 'Thumb')
RangeOfMotion.create(component: elbow, motion: 'Opposition', degrees: '', notes: 'Thumb. Normally the patient should be able to touch the tip of their thumb to each of the other fingertips')

RangeOfMotion.create(component: hip, motion: 'Flexion', degrees: '90', notes: 'Knee extended')
RangeOfMotion.create(component: hip, motion: 'Flexion', degrees: '120', notes: 'Knee flexed')
RangeOfMotion.create(component: hip, motion: 'Extension', degrees: '30', notes: 'Knee extended')
RangeOfMotion.create(component: hip, motion: 'Abduction', degrees: '45', notes: 'Maximum')
RangeOfMotion.create(component: hip, motion: 'Adduction ', degrees: '', notes: 'Maximum')
RangeOfMotion.create(component: hip, motion: 'Internal rotation', degrees: '40', notes: '')
RangeOfMotion.create(component: hip, motion: 'External rotation', degrees: '45', notes: '')

RangeOfMotion.create(component: knee, motion: 'Flexion', degrees: '130', notes: '')
RangeOfMotion.create(component: knee, motion: 'Extension', degrees: '0-15', notes: 'Full extension is 0 up to 15')
RangeOfMotion.create(component: knee, motion: 'Internal rotation', degrees: '0-10', notes: '')
RangeOfMotion.create(component: knee, motion: 'External rotation', degrees: '0-10', notes: '')

RangeOfMotion.create(component: knee, motion: 'Ankle dorsiflexion', degrees: '20', notes: '')
RangeOfMotion.create(component: knee, motion: 'Ankle plantar flexion', degrees: '45', notes: '')
RangeOfMotion.create(component: knee, motion: 'Subtalar inversion', degrees: '30', notes: '')
RangeOfMotion.create(component: knee, motion: 'Subtalar eversion', degrees: '20', notes: '')
RangeOfMotion.create(component: knee, motion: 'Forefoot abduction', degrees: '10', notes: 'Stabilization required')
RangeOfMotion.create(component: knee, motion: 'Forefoot adduction', degrees: '20', notes: 'Stabilization required')

# Muscle
Muscle.create(component: cervical_spine, name: 'Sternocleidomastoid')
Muscle.create(component: cervical_spine, name: 'Trapezius')
Muscle.create(component: cervical_spine, name: 'Flexors')
Muscle.create(component: cervical_spine, name: 'Extensors')

Muscle.create(component: shoulder, name: 'Flexion')
Muscle.create(component: shoulder, name: 'Extension')
Muscle.create(component: shoulder, name: 'Abduction')
Muscle.create(component: shoulder, name: 'Adduction')
Muscle.create(component: shoulder, name: 'External Rotation')
Muscle.create(component: shoulder, name: 'Internal Rotation')

Muscle.create(component: elbow, name: 'Flexion')
Muscle.create(component: elbow, name: 'Extension')
Muscle.create(component: elbow, name: 'Supination')
Muscle.create(component: elbow, name: 'Pronation')

Muscle.create(component: elbow, name: 'Grip strength')
Muscle.create(component: elbow, name: 'Finger adduction')
Muscle.create(component: elbow, name: 'Finger abduction')

Muscle.create(component: hip, name: 'Flexion')
Muscle.create(component: hip, name: 'Extension')
Muscle.create(component: hip, name: 'Abduction')
Muscle.create(component: hip, name: 'Adduction')
Muscle.create(component: hip, name: 'Internal rotation')
Muscle.create(component: hip, name: 'External rotation')

Muscle.create(component: knee, name: 'Knee flexion (Hamstring)')
Muscle.create(component: knee, name: 'Knee extension (Quadriceps)')
Muscle.create(component: knee, name: 'Internal rotation')
Muscle.create(component: knee, name: 'External rotation')

Muscle.create(component: knee, name: 'Ankle dorsiflexion')
Muscle.create(component: knee, name: 'Ankle plantarflexion')
Muscle.create(component: knee, name: 'Inversion')
Muscle.create(component: knee, name: 'Eversion')
Muscle.create(component: knee, name: 'Flexion of toes')
Muscle.create(component: knee, name: 'Extension of toes')

# Special Test
spurling_test                = SpecialTest.create(component: cervical_spine, name: 'Spurling\'s Test', positive_sign: 'Radiating pain', indication: 'Nerve root impingement')
compression_distraction_test = SpecialTest.create(component: cervical_spine, name: 'Compression and Distraction Tests', positive_sign: 'Reproduction of pain and relief of pain', indication: 'Issue with the cervical spine that warrants further investigation')

straight_leg_raising_test = SpecialTest.create(component: lumbar_spine, name: 'Straight Leg Raising Test', positive_sign: 'Radiating pain below the knee', indication: 'Nerve root irritation or lumbar disc herniation', notes: 'Have the patient lie supine with the neck slightly flexed. Lift the leg upward by supporting the foot around the calcaneus. The knee should remain straight as you do this. No pain should be felt below the knee with leg raising. Many people may experience pain during this, but is it sciatic nerve pain or hamstring tightness? Sciatic nerve pain will extend down the whole leg, whereas hamstring tightness will involve only the posterior thigh. Flexion of the knee often eliminates the pain with leg raising (due to hamstring tightness). Repeat the procedure on the unaffected leg. Crossover pain in the affected leg with this maneuver is more supportive of the finding of tension on the nerve roots.')
femoral_stretch_test      = SpecialTest.create(component: lumbar_spine, name: 'Femoral Stretch Test', positive_sign: 'Pain', indication: 'Nerve root compression at L1-L3')

apley_scratch_test = SpecialTest.create(component: shoulder, name: 'Apley Scratch Test', positive_sign: '', indication: '', notes: 'This is the quickest active way to evaluate a patient’s range of motion.  First, to test abduction and external rotation, ask the patient to reach behind their head and touch the superior medial angle of the opposite scapula.  Then to test internal rotation and adduction, have the patient reach behind their back to touch the inferior angle of the opposite scapula.  This is a good screening test for adhesive capsulitis (frozen shoulder).  A mnemonic to use for this is “Ab Ex and Ad In” [abduction/external rotation and adduction/internal rotation]')
yergason_test      = SpecialTest.create(component: shoulder, name: 'Yergason Test', positive_sign: 'Tendon pops out of the groove or if pain occurs upon palpation', indication: 'Instability of biceps tendon or tendonitis', notes: 'This test evaluates the stability of biceps tendon in the bicipital groove.  To perform the test, palpate the long head of the biceps brachii tendon.  Next, flex the patients forearm at a right angle, and stabilize the elbow.  Then, have the patient externally rotate the forearm against resistance.  A positive test occurs if the tendon pops out of the groove.  Repeat, but supinate the forearm instead.  Tenderness at the groove is a sign of tendonitis')
drop_arm_test      = SpecialTest.create(component: shoulder, name: 'Drop Arm Test', positive_sign: 'Cannot hold the arm and it drops', indication: 'Rotator cuff injury, especially the supraspinatus muscle', notes: 'This test helps to determine whether there is a tear in the rotator cuff, especially by the supraspinatus muscle tendon.  If a tear is present, patients can no longer control motion.  To test, have patient fully abduct their arm, and then ask them to slowly lower the arm.  While the arm is in abduction, gently push down on the arm. A positive test occurs when the patient cannot hold the arm and it drops (thus the name).')
neer_test          = SpecialTest.create(component: shoulder, name: 'Neer Test', positive_sign: 'Pain', indication: 'Rotator cuff inflammation or tear', notes: 'To perform this test have the patient internally rotate the shoulder and then forward flex the patients arm up to 150°.  This will then press the supraspinatus muscle against the acromion.  If the patient experiences increased shoulder pain with this maneuver, then they are most likely having impingement of the muscles due to rotator cuff inflammation or a tear.')
hawkins_test       = SpecialTest.create(component: shoulder, name: 'Hawkins-Kennedy Test', positive_sign: 'Pain', indication: 'Rotator cuff tear or impingement', notes: 'Flex elbow to 90°, abduct the arm to 90°, and internally rotate humerus.  Pain indicates rotator cuff tear or impingement.')
supraspinatus_test = SpecialTest.create(component: shoulder, name: 'Supraspinatus Test/Empty Can Test', positive_sign: 'Pain', indication: 'Rotator cuff injury or supraspinatus tendonitis', notes: 'Have patient abduct 90°, flex their arm 30°, and hold it like they are holding an empty can.  See whether or not they can withstand holding their arm up. A positive test occurs in rotator cuff injury or supraspinatus tendonitis')
apprehension_test  = SpecialTest.create(component: shoulder, name: 'Apprehension Test', positive_sign: 'Patient exhibits fear and apprehension during test', indication: 'Anterior shoulder subluxation', notes: 'This test is used when you are dealing with a possible subluxation of the anterior shoulder.  To test, have the patient abduct their shoulder and externally rotate it.  Then push the shoulder posterior to anterior while further externally rotating arm.  A positive test occurs when the patient exhibits fear and apprehension when you are pushing.')
jerk_test          = SpecialTest.create(component: shoulder, name: 'Jerk Test', positive_sign: 'Subluxation or dislocation occurs', indication: 'Posterior shoulder subluxation', notes: 'Internally rotate the arm and flex at 90° with the elbow flexed to 90°.  Push the humerus posteriorly at the elbow.  The test is positive if subluxation or dislocation occurs.')
sulcus_test        = SpecialTest.create(component: shoulder, name: 'Sulcus Test', positive_sign: 'Widening of the sulcus between the humerus and acromion', indication: 'Inferior shoulder subluxation', notes: 'Pull down on the arm while relaxed at the patient’s side.  If subluxation occurs there will be widening of the sulcus between the humerus and acromion.')

ligamentous_stability_test = SpecialTest.create(component: elbow, name: 'Ligamentous Stability Test', positive_sign: 'Excessive gapping with valgus or varus stress', indication: 'Instability of the medial collateral ligament or the lateral collateral ligament of the elbow', notes: 'this is to determine the stability of the medial and lateral collateral ligaments of the elbow.  To conduct this test, cup the posterior aspect of the patient’s elbow in one hand and hold their forearm with the other.  Your hand on the elbow will act as a fulcrum around which your other hand will force the forearm during the test.  First, instruct the patient to flex their elbow a few degrees as you force the forearm laterally, producing a medial (valgus) stress on the joint’s medial side.  Notice if there is any gapping on the medial side underneath your hand.  Then, reverse direction and push the forearm medially, producing a lateral (varus) stress on the joint’s lateral side.  Again, inspect for any gapping on the lateral side.  Your hand, in its position on the elbow, acts not only as a stabilizer and a fulcrum, but also as a means for palpating the collateral ligaments during the test.')
tinels_sign                = SpecialTest.create(component: elbow, name: 'Tinel\'s Sign', positive_sign: 'Tingling sensation down the forearm to the ulnar distribution of the hand', indication: 'Ulnar nerve entrapment', notes: 'The Tinel\'s sign at the elbow is checking for the irritation or entrapment of the ulnar nerve as it passes through the ulnar groove.  The Tinel’s sign at the wrist checks the median nerve.  To perform this test locate the groove between the olecranon and the medial epicondyle and tap over the ulnar nerve as it passes through this groove.  A positive test is a tingling sensation down the forearm to the ulnar distribution of the hand')
tennis_elbow_test          = SpecialTest.create(component: elbow, name: 'Tennis Elbow Test/Cozen\'s Sign', positive_sign: 'Severe pain at the lateral epicondyle', indication: 'Lateral epicondylitis', notes: 'Instruct the patient to pronate the forearm with the elbow bent.  Then ask the patient to make a fist and extend the wrist.  The examiner holds the elbow and attempts to flex the hand while the patient is resisting in extension.  If the patient has tennis elbow, they will experience a sudden severe pain at the site of the wrist extensors’ common origin, the lateral epicondyle (lateral epicondylitis is occurring)')

flexor_digitorum_superficialis = SpecialTest.create(component: wrist_and_hand, name: 'Flexor Digitorum Superficialis', positive_sign: '', indication: '', notes: 'this muscle flexes the phalanges at the PIP. To perform this test hold the patient’s fingers in extension, except for the finger being tested.  This isolates the flexor digitorum superficialis tendon. Then instruct the patient to flex the finger in question at the PIP joint')
flexor_digitorum_profundus     = SpecialTest.create(component: wrist_and_hand, name: 'Flexor Digitorum Profundus', positive_sign: '', indication: '', notes: 'This muscle flexes the phalanges at the DIP.  To test, isolate the DIP joint by stabilizing the metacarpophalangeal and interphalangeal joints in extension.  Then ask the patient to flex his finger at the DIP joint.  If they are able to do so, the tendon is functional.  If they cannot, the tendon may be cut or the muscle denervated')

allen_test                 = SpecialTest.create(component: wrist_and_hand, name: 'Allen Test', positive_sign: 'Release of ulnar artery does not return hand back to expected color (documented as a negative Allen test)', indication: 'Ulnar artery insufficiency (do not perform ABG on that radial artery)', notes: 'This is to test the patency of the ulnar artery.  Compress both the ulnar and radial arteries simultaneously, then release the ulnar to see if hand turns back to normal color.  If not, you should suspect ulnar artery insufficiency.  DO NOT TAKE ARTERIAL BLOOD GASES (ABGs)')
wrist_and_hand_tinels_sign = SpecialTest.create(component: wrist_and_hand, name: 'Tinel\'s Sign', positive_sign: 'Tingling sensation in the median distribution of the hand', indication: 'Median nerve entrapment', notes: 'Tap on the median nerve at the wrist right above the flexor retinaculum.  A positive test is when there is the presence of paresthesia in the 1st digit, 2nd digit, 3rd digit, and ½ of the 4th digit')
phalens_test               = SpecialTest.create(component: wrist_and_hand, name: 'Phalen\'s Test', positive_sign: 'Tingling sensation in the median distribution of the hand', indication: 'Median nerve entrapment', notes: 'Performed by flexing the patient’s wrist to its maximum degree and holding it in that position for at least a minute.  A positive test is when there is the presence of paresthesia in the 1st digit, 2nd digit, 3rd digit, and ½ of the 4th digit')

trendelenburg_test = SpecialTest.create(component: hip, name: 'Trendelenburg Test', positive_sign: 'Iliac crest drops on the side of the lifted leg', indication: 'Hip abductors on the weight bearing side are weak', notes: 'Tests for weak abductor muscles.  Ask the patient to stand and balance on one foot.  Observe the patient from behind and determine whether or not there is any asymmetry or change in the level of the iliac crest.  If the iliac crest drops on the side of the lifted leg, then the hip abductor muscles on the weight bearing side are weak. Repeat with the other side')
thomas_test        = SpecialTest.create(component: hip, name: 'Thomas Test', positive_sign: 'Normal flexion of one hip and approximately 15 degrees of flexion contracture of the other hip', indication: 'Tight iliopsoas muscle', notes: 'Tests for flexion contractures of the hip.  Have the patient lie in the supine position and flex the left leg as far as it will go. The test is positive when there is normal flexion of the left leg and there is about 15° of flexion contracture on the right hip (due to a tight iliopsoas muscle) [could also occur in opposite direction as well].  Repeat with the other side.')
faber_test         = SpecialTest.create(component: hip, name: 'Patrick Test/FABER Test', positive_sign: 'Pain in the groin, anterior thigh, or trochanteric region or pain in the ipsilateral SI joint', indication: 'Hip joint pathology or SI joint disorder', notes: 'Used to detect pathology in the hip, as well as in the sacroiliac joint.  Have the patient lie supine on the table and place the foot of their involved side on his opposite knee.  The hip joint is now flexed, abducted, and externally rotated.  To stress the SI joint, extend the range of motion by placing one hand on the flexed knee joint and the other hand on the ASIS of the opposite side, press down on each of these points as if you were opening the binding of a book. The presence of muscle spasm, limitation of motion, or pain felt in the groin, anterior thigh, or trochanteric region indicates hip joint pathology such as osteoarthritis.  In contrast, pain in the ipsilateral SI joint indicates SI joint disorder, such as sacroiliitis.')

lateral_ligament_stability_test = SpecialTest.create(component: hip, name: 'Lateral Ligament Stability Test', positive_sign: 'Abnormal lateral movement or abnormal medial movement', indication: 'Instability of the medial collateral ligament or lateral collateral ligament of the knee', notes: 'Tests stability of the lateral collateral ligament.  Have the patient lie supine with the knee nearly extended. Grasp the medial aspect of the knee and pull the ankle of the same side medially. Abnormal lateral movement is a positive test')
medial_ligament_stability_test  = SpecialTest.create(component: hip, name: 'Medial Ligament Stability Test', positive_sign: 'Abnormal lateral movement or abnormal medial movement', indication: 'Instability of the medial collateral ligament or lateral collateral ligament of the knee', notes: 'Tests stability of medial collateral ligament.  Have the patient lie supine with the knee nearly extended.  Grasp the lateral aspect of the knee and pull the ankle of the same side laterally.  Abnormal medial movement is a positive test.')
anterior_drawer_test            = SpecialTest.create(component: hip, name: 'Anterior Drawer Test', positive_sign: 'Abnormal forward mobility of 2 cm or more', indication: 'Anterior cruciate ligament tear', notes: 'Tests for anterior cruciate ligament tear. With the patient supine, have the patient flex the knee to 45-90°.  Stabilize the leg by sitting gently on the patient’s foot.  Then grasp the leg just below the knee with both hands and jerk the tibia forward.  Abnormal forward mobility of 2 cm or more is a positive test')
posterior_drawer_test           = SpecialTest.create(component: hip, name: 'Posterior Drawer Test', positive_sign: 'Abnormal backward mobility of 2 cm or more', indication: 'Posterior cruciate ligament tear', notes: 'Tests for posterior cruciate ligament tear.  With the patient supine, have the patient flex the knee to 45-90°.  Stabilize the leg by gently sitting on the patient’s foot.  Then, grasp the leg just below the knee with both hands and push the tibia posteriorly.  Abnormal backward mobility of 2 cm or more is a positive test')
lachmans_test                   = SpecialTest.create(component: hip, name: 'Lachman\'s Test', positive_sign: 'Increased laxity in the anterior cruciate ligament', indication: 'Anterior cruciate ligament tear', notes: 'Tests for anterior cruciate ligament tear.  Have the patient lie supine with the extremity to be tested next to the examiner. The knee is positioned between 20 and 30° flexion.  Stabilize the distal lateral femur with one hand and grasp the medial proximal tibia with the other hand with the fingers posterior and the thumbs anterior and medial.  Apply a pressure through the fingers and the palm of the hand that translates the tibia anteriorly.  The test is positive when there is increased laxity in the anterior cruciate ligament.')
ballottement_test               = SpecialTest.create(component: hip, name: 'Ballottement Test', positive_sign: 'Patella rebounds when pushed down', indication: 'Excess fluid or an effusion in the knee', notes: 'Tests for excess fluid or an effusion in the knee.  When the joint is distended by a large effusion, carefully extend the patient’s knee and instruct him/her to relax the quadriceps muscles.  Then, push the patella into the trochlear groove and quickly release it.  The large amount of fluid lying under the patella is first forced to the sides of the joint and then flows back to its former position, forcing the patella to rebound.  This is referred to as a ballotable patella')
mcmurray_test                   = SpecialTest.create(component: hip, name: 'McMurray Test', positive_sign: 'Palpable or audible click within the joint', indication: 'Medial or lateral meniscus tear', notes: 'Tests for a meniscal tear.  During knee flexion and extension, a torn meniscus may produce a palpable or audible “clicking” in the region of the joint line.  Ask the patient to lie supine with their legs flat and in the neutral position.  With one hand, take hold of their heel and flex the leg fully.  Then, place your free hand on the knee joint with your fingers touching the medial joint line and your thumb and thenar eminence against the lateral joint line, and rotate the leg internally and externally to loosen the knee joint.   Push on the lateral side to apply valgus stress to the medial side of the joint, while at the same time rotating the leg externally. Maintain the valgus stress and external rotation, and extend the leg slowly as you palpate the medial joint line.  If this maneuver causes a palpable or audible “click” within the joint, there is a probable tear in the medial meniscus.  Now repeat with internal rotation and varus strain to test the lateral meniscus.  Pain, grinding, and/or lack of extension are all positive signs')
apley_compression_test          = SpecialTest.create(component: hip, name: 'Apley Compression Test', positive_sign: 'Pain in the knee with compression', indication: 'Medial and/or lateral meniscus injury', notes: 'Tests for meniscal tear.  Have the patient lie prone with the knee at a right angle.  Then, hold the plantar surface of the patient’s heel and apply a compressive force while internally and externally rotating the heel.  The test is positive when there is pain in the knee with compression')
apley_distraction_test          = SpecialTest.create(component: hip, name: 'Apley Distraction Test', positive_sign: 'Pain in the knee with distraction', indication: 'Medial and/or lateral collateral ligament of the knee injury', notes: 'Tests for medial and lateral collateral ligament injury. Have the patient lie prone with the knee at a right angle.  Then, cup one hand around the posterior heel and the place the other hand (or use your knee) at the distal end of the thigh.  Then pull up while preventing the femur from rising and externally and internally rotate the foot.  The test is positive when there is pain in the knee with distraction')

thompson_doherty_squeeze_test = SpecialTest.create(component: hip, name: 'Thompson-Doherty Squeeze Test', positive_sign: 'No plantarflexion occurs when the calf is squeezed', indication: 'Achilles tendon rupture', notes: 'Tests for ruptured Achilles tendon.  Squeeze the calf and notice the motion of the foot.  Normally, squeezing produces plantarflexion.  A ruptured Achilles tendon produces little or no motion')
homans_sign_test              = SpecialTest.create(component: hip, name: 'Homan\'s Sign Test', positive_sign: '', indication: '', notes: 'Tests for DVT in the calf.  Dorsiflex the foot. The test is positive when dorsiflexion elicits pain in the calf area.  (Sensitivity:  10-54%; Specificity:  38-89%).')
ankle_drawer_sign_test        = SpecialTest.create(component: hip, name: 'Ankle Drawer Sign Test', positive_sign: 'Obvious extreme forward displacement of the entire foot on the tibia', indication: 'Anterior talofibular ligament injury', notes: 'Tests for disruption of anterior talofibular ligament.  The following 3 things are necessary to detect a positive drawer sign; First:  the anterior and posterior muscles which actuate the ankle must be relaxed.  This achieved by having the patient in either the sitting or supine position with the knee flexed to 90°. Second:  the ankle must be positioned at 10 to 20°plantarflexion.  Third:  for right ankle testing, place left hand over anterior distal tibia proximal to ankle joint; place the right hand on the medial surface curving the fingers over the posterior calcaneus.  Pull forward on the heel while pushing posteriorly on the tibia.  Repeat with the left side.  A positive test is when there is obvious extreme forward displacement of the entire foot on the tibia (when compared to the contralateral side).')

# Exam Technique
far_visual_activity           = ExamTechnique.create(system: eye, name: 'Far Visual Activity', details: 'Snellen Chart')
near_visual_activity          = ExamTechnique.create(system: eye, name: 'Near Visual Activity', details: 'Rosenbaum Chart')

# Video Link
VideoLink.create(special_tests: [spurling_test], title: 'Spurling\'s Test', link: 'https://www.youtube.com/watch?v=VYENa1Dre10')
VideoLink.create(special_tests: [compression_distraction_test], title: 'Cervical Compression and Distraction Test', link: 'https://www.youtube.com/watch?v=TnoJySUENAk')
VideoLink.create(special_tests: [straight_leg_raising_test], title: 'Straight Leg Raising Test', link: 'https://www.youtube.com/watch?v=aL85pm7J6Io')
VideoLink.create(special_tests: [yergason_test], title: 'Yergason Test', link: 'https://www.youtube.com/watch?v=uDrHy4Ob4yI')
VideoLink.create(special_tests: [drop_arm_test], title: 'Drop Arm Test', link: 'https://www.youtube.com/watch?v=Jv3OzKNAyHQ')
VideoLink.create(special_tests: [neer_test], title: 'Neer Test', link: 'https://www.youtube.com/watch?v=Gk9tOHSvW1A')
VideoLink.create(special_tests: [hawkins_test], title: 'Hawkins Test', link: 'https://www.youtube.com/watch?v=nTXvtEx9t2w')
VideoLink.create(special_tests: [hawkins_test], title: 'Hawkin\'s Kennedy Test', link: 'https://www.youtube.com/watch?v=8MyJwPvIvBg')
VideoLink.create(special_tests: [supraspinatus_test], title: 'Supraspinatus Test', link: 'https://www.youtube.com/watch?v=lucHrTMP0QI')
VideoLink.create(special_tests: [apprehension_test], title: 'Apprehension Test', link: 'https://www.youtube.com/watch?v=HvoZ92ZFn9c')
VideoLink.create(special_tests: [jerk_test], title: 'Jerk Test', link: 'https://www.youtube.com/watch?v=pQq95HQboU4')
VideoLink.create(special_tests: [sulcus_test], title: 'Sulcus Test', link: 'https://www.youtube.com/watch?v=sIhWzU1WtFs')
VideoLink.create(special_tests: [ligamentous_stability_test], title: 'Ligamentous Stability Testing at the Elbow', link: 'https://www.youtube.com/watch?v=qOQKB-4hkMY')
VideoLink.create(special_tests: [tinels_sign], title: 'Tinel\'s Sign at the Elbow', link: 'https://www.youtube.com/watch?v=Tk-w18_EjVk')
VideoLink.create(special_tests: [tennis_elbow_test], title: 'Tennis Elbow Test', link: 'https://www.youtube.com/watch?v=ZmZVofLqZS4')
VideoLink.create(special_tests: [flexor_digitorum_superficialis, flexor_digitorum_profundus], title: 'Long Finger Flexor Tests', link: 'https://www.youtube.com/watch?v=OStny5IhA6g')
VideoLink.create(special_tests: [allen_test], title: 'Allen Test', link: 'https://www.youtube.com/watch?v=hLov_jwTBkg')
VideoLink.create(special_tests: [wrist_and_hand_tinels_sign], title: 'Tinel\'s Sign at the Wrist', link: 'https://www.youtube.com/watch?v=SuCVcsNUeJA')
VideoLink.create(special_tests: [phalens_test], title: 'Phalen\'s Sign', link: 'https://www.youtube.com/watch?v=iPRG43m1_Vc')
VideoLink.create(special_tests: [trendelenburg_test], title: 'Trendelenburg Test', link: 'https://www.youtube.com/watch?v=l07aYtKma_U')
VideoLink.create(special_tests: [thomas_test], title: 'Thomas Test 1', link: 'https://www.youtube.com/watch?v=FNYm7zxjGMQ')
VideoLink.create(special_tests: [thomas_test], title: 'Thomas Test 2', link: 'https://www.youtube.com/watch?v=rTPdKOqg0G8')
VideoLink.create(special_tests: [faber_test], title: 'FABER Patrick Test', link: 'https://www.youtube.com/watch?v=ZRtgAcRDL1Y')
VideoLink.create(special_tests: [lateral_ligament_stability_test, medial_ligament_stability_test], title: 'Ligamentous Stability', link: 'https://www.youtube.com/watch?v=Xgn35yfqCdg')
VideoLink.create(special_tests: [anterior_drawer_test], title: 'Anterior Drawer Test', link: 'https://www.youtube.com/watch?v=fmsUE7gdkLQ')
VideoLink.create(special_tests: [posterior_drawer_test], title: 'Posterior Drawer Test', link: 'https://www.youtube.com/watch?v=DC0sQbtwF90')
VideoLink.create(special_tests: [lachmans_test], title: 'Lachman\'s Test', link: 'https://www.youtube.com/watch?v=F7-9eofB80U')
VideoLink.create(special_tests: [mcmurray_test], title: 'McMurray Test', link: 'https://www.youtube.com/watch?v=bJWpS_05QSA')
VideoLink.create(special_tests: [apley_compression_test], title: 'Appley Compression Test', link: 'https://www.youtube.com/watch?v=k2ZoJ6oUyNo')
VideoLink.create(special_tests: [apley_distraction_test], title: 'Appley Distraction Test', link: 'https://www.youtube.com/watch?v=k2ZoJ6oUyNo')
VideoLink.create(special_tests: [thompson_doherty_squeeze_test], title: 'Thompson Doherty Squeeze Test', link: 'https://www.youtube.com/watch?v=71GG5-CT4GU')
VideoLink.create(special_tests: [homans_sign_test], title: 'Homan\'s Sign', link: 'https://www.youtube.com/watch?v=5-LCDB_PPYM')
VideoLink.create(special_tests: [ankle_drawer_sign_test], title: 'Ankle Drawer Sign', link: 'https://www.youtube.com/watch?v=kfMgPb4SXjs')

# Image Link
ImageLink.create(special_tests: [spurling_test], title: 'Spurling\'s Test', link: Cloudinary::Api.resource('musculoskeletal/spurling_test')['secure_url'])

ImageLink.create(special_tests: [compression_distraction_test], title: 'Compression Test', link: Cloudinary::Api.resource('musculoskeletal/compression_test')['secure_url'])
ImageLink.create(special_tests: [compression_distraction_test], title: 'Distraction Test', link: Cloudinary::Api.resource('musculoskeletal/distraction_test')['secure_url'])

ImageLink.create(special_tests: [yergason_test], title: 'Yergason Test 1', link: Cloudinary::Api.resource('musculoskeletal/yergasons_test_1')['secure_url'])
ImageLink.create(special_tests: [yergason_test], title: 'Yergason Test 2', link: Cloudinary::Api.resource('musculoskeletal/yergasons_test_2')['secure_url'])

ImageLink.create(special_tests: [drop_arm_test], title: 'Yergason Test 2', link: Cloudinary::Api.resource('musculoskeletal/drop_arm_test_1')['secure_url'])
ImageLink.create(special_tests: [drop_arm_test], title: 'Yergason Test 2', link: Cloudinary::Api.resource('musculoskeletal/drop_arm_test_2')['secure_url'])

ImageLink.create(special_tests: [neer_test], title: 'Neer Test', link: Cloudinary::Api.resource('musculoskeletal/neer_test')['secure_url'])

ImageLink.create(special_tests: [hawkins_test], title: 'Hawkins Kennedy Test', link: Cloudinary::Api.resource('musculoskeletal/hawkins-kennedy_test')['secure_url'])

ImageLink.create(special_tests: [supraspinatus_test], title: 'Supraspinatus Test', link: Cloudinary::Api.resource('musculoskeletal/supraspinatus_test')['secure_url'])

ImageLink.create(special_tests: [apprehension_test], title: 'Apprehension Test', link: Cloudinary::Api.resource('musculoskeletal/apprehension_test')['secure_url'])

ImageLink.create(special_tests: [jerk_test], title: 'Jerk Test', link: Cloudinary::Api.resource('musculoskeletal/jerk_test')['secure_url'])

ImageLink.create(special_tests: [sulcus_test], title: 'Sulcus Test', link: Cloudinary::Api.resource('musculoskeletal/sulcus_test')['secure_url'])

ImageLink.create(special_tests: [ligamentous_stability_test], title: 'Elbow Ligamentous Stability Test', link: Cloudinary::Api.resource('musculoskeletal/elbow_ligamentous_stability_test')['secure_url'])

ImageLink.create(special_tests: [tinels_sign], title: 'Tinel\'s Sign Test', link: Cloudinary::Api.resource('musculoskeletal/tinels_sign_test')['secure_url'])

ImageLink.create(special_tests: [tennis_elbow_test], title: 'Tennis Elbow Test', link: Cloudinary::Api.resource('musculoskeletal/tennis_elbow_test')['secure_url'])

ImageLink.create(special_tests: [flexor_digitorum_superficialis], title: 'Flexor Digitorum Superficialis', link: Cloudinary::Api.resource('musculoskeletal/flexor_digitorum_superficiali_test')['secure_url'])

ImageLink.create(special_tests: [flexor_digitorum_profundus], title: 'Flexor Digitorum Profundus', link: Cloudinary::Api.resource('musculoskeletal/flexor_digitorum_profundus_1')['secure_url'])
ImageLink.create(special_tests: [flexor_digitorum_profundus], title: 'Flexor Digitorum Profundus', link: Cloudinary::Api.resource('musculoskeletal/flexor_digitorum_profundus_2')['secure_url'])

ImageLink.create(special_tests: [allen_test], title: 'Allen Test', link: Cloudinary::Api.resource('musculoskeletal/allen_test')['secure_url'])

ImageLink.create(special_tests: [wrist_and_hand_tinels_sign], title: 'Tinel\'s Test', link: Cloudinary::Api.resource('musculoskeletal/wrist_and_hand_tinels_sign')['secure_url'])

ImageLink.create(special_tests: [phalens_test], title: 'Phalen\'s Test', link: Cloudinary::Api.resource('musculoskeletal/phalens_test')['secure_url'])

ImageLink.create(special_tests: [trendelenburg_test], title: 'Trendelenburg Test Positive', link: Cloudinary::Api.resource('musculoskeletal/trendelenburg_test_positive')['secure_url'])
ImageLink.create(special_tests: [trendelenburg_test], title: 'Trendelenburg Test Negative', link: Cloudinary::Api.resource('musculoskeletal/trendelenburg_test_negative')['secure_url'])

ImageLink.create(special_tests: [thomas_test], title: 'Thomas Test', link: Cloudinary::Api.resource('musculoskeletal/thomas_test')['secure_url'])

ImageLink.create(special_tests: [faber_test], title: 'FABER Test', link: Cloudinary::Api.resource('musculoskeletal/patrick_faber_test')['secure_url'])

ImageLink.create(special_tests: [medial_ligament_stability_test], title: 'Knee Ligament Stability Test', link: Cloudinary::Api.resource('musculoskeletal/knee_ligament_stability_test')['secure_url'])

ImageLink.create(special_tests: [anterior_drawer_test], title: 'Anterior Drawer Test', link: Cloudinary::Api.resource('musculoskeletal/drawer_test_anterior')['secure_url'])

ImageLink.create(special_tests: [posterior_drawer_test], title: 'Posterior Drawer Test', link: Cloudinary::Api.resource('musculoskeletal/drawer_test_posterior')['secure_url'])

ImageLink.create(special_tests: [lachmans_test], title: 'Lachman\'s Test', link: Cloudinary::Api.resource('musculoskeletal/lachmans_test')['secure_url'])

ImageLink.create(special_tests: [mcmurray_test], title: 'McMurray Test 1', link: Cloudinary::Api.resource('musculoskeletal/mcmurray_test_1')['secure_url'])
ImageLink.create(special_tests: [mcmurray_test], title: 'McMurray Test 2', link: Cloudinary::Api.resource('musculoskeletal/mcmurray_test_2')['secure_url'])

ImageLink.create(special_tests: [apley_compression_test], title: 'Apley Compression Test', link: Cloudinary::Api.resource('musculoskeletal/apley_test_compression')['secure_url'])

ImageLink.create(special_tests: [apley_distraction_test], title: 'Apley Distraction Test', link: Cloudinary::Api.resource('musculoskeletal/apley_test_distraction')['secure_url'])

ImageLink.create(special_tests: [thompson_doherty_squeeze_test], title: 'Thompson-Doherty Squeeze Test', link: Cloudinary::Api.resource('musculoskeletal/thompson-doherty_squeeze_test')['secure_url'])

ImageLink.create(special_tests: [homans_sign_test], title: 'Homan\'s Test', link: Cloudinary::Api.resource('musculoskeletal/homans_sign_test')['secure_url'])

ImageLink.create(special_tests: [ankle_drawer_sign_test], title: 'Ankle Drawer Sign Test', link: Cloudinary::Api.resource('musculoskeletal/ankle_drawer_sign_test')['secure_url'])