# This file should contain all the record creation needed to seed the database with its default values.
# The api can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Personnel Acknowledgements
print 'Seeding Personnel Acknowledgements...'

PersonnelAcknowledgement.create(name: 'Lauren Burton, OMS-III', role: 'Project Coordinator', notes: 'Clinical Sciences Graduate Teaching Assistant at West Virginia School of Osteopathic Medicine under the supervision of Dr. Kathleen Martin, M.D.')
PersonnelAcknowledgement.create(name: 'Shaun Raganyi, OMS-III', role: 'Creator', notes: 'Clinical Sciences Graduate Teaching Assistant at West Virginia School of Osteopathic Medicine. Under supervision of Dr. Gail Swarm, D.O.')
PersonnelAcknowledgement.create(name: 'Nicholas Alexander', role: 'Developer', notes: 'Under the supervision of Dr. Paulus Wahjudi, Ph.D. at Marshall University')
PersonnelAcknowledgement.create(name: 'Matthew Taylor', role: 'Developer', notes: 'Under the supervision of Dr. Paulus Wahjudi, Ph.D. at Marshall University')
PersonnelAcknowledgement.create(name: 'Gabriel Hoverman', role: 'Developer', notes: 'Under the supervision of Dr. Paulus Wahjudi, Ph.D. at Marshall University')
PersonnelAcknowledgement.create(name: 'Dr. Gail Swarm, D.O.', role: 'Contributor', notes: '')
PersonnelAcknowledgement.create(name: 'Dr. Kathleen Martin, M.D.', role: 'Contributor', notes: '')
PersonnelAcknowledgement.create(name: 'Dr. Jill Cochran, Ph.D., C-FNP', role: 'Contributor', notes: '')
PersonnelAcknowledgement.create(name: 'Dr. Thomas Steele, D.O.', role: 'Contributor', notes: '')
PersonnelAcknowledgement.create(name: 'Dr. Craig Boisvert, D.O.', role: 'Contributor', notes: '')
PersonnelAcknowledgement.create(name: 'Dr. Kristina McGraw, D.O.', role: 'Contributor', notes: '')
PersonnelAcknowledgement.create(name: 'All Clinical Sciences Faculty', role: '', notes: 'West Virginia School of Osteopathic Medicine')
PersonnelAcknowledgement.create(name: 'Dr. Daryn Straley, D.O.', role: 'In Memorial', notes: '')

puts 'Done'

# Software Acknowledgements
print 'Seeding Software Acknowledgements...'

SoftwareAcknowledgement.create(name: 'SwiftyJSON', link: 'https://github.com/SwiftyJSON/SwiftyJSON')
SoftwareAcknowledgement.create(name: 'NYTPhotoViewer', link: 'https://github.com/NYTimes/NYTPhotoViewer')
SoftwareAcknowledgement.create(name: 'Async', link: 'https://github.com/duemunk/Async')
SoftwareAcknowledgement.create(name: 'Icons8', link: 'https://icons8.com')

puts 'Done'

# Systems
print 'Seeding Systems...'

musculoskeletal          = System.create(name: 'Musculoskeletal', details: 'The complete musculoskeletal exam contains 5 parts, which must be applied to each joint/region that you are examining')
eye                      = System.create(name: 'Eye', details: '')
cardiovascular           = System.create(name: 'Cardiovascular', details: '')
heent                    = System.create(name: 'Head, Ears, Nose, Neck, Throat', details: '')
respiratory              = System.create(name: 'Respiratory', details: '')
neurological             = System.create(name: 'Neurological', details: 'Some common chief complaints in which a full neurological exam should be performed include headache (eye exam should be considered), fatigue, weakness, sudden visual change (eye exam should be considered), eye pain (eye exam should be considered), any cognitive complaints, behavioral issues, psychiatric complaints, etc.  There should be a very low threshold present in order to perform a full neurological exam')
abdomen                  = System.create(name: 'Abdomen', details: 'Always remember to perform auscultation prior to percussion and/or palpation (this is an easy thing to forget and this is simply a reminder')
vitalsigns               = System.create(name: 'Vital Signs', details: '')

puts 'Done'

# Components
print 'Seeding Components...'

cervical_spine           = Component.create(system: musculoskeletal, name: 'Cervical Spine', inspection: 'Begin inspection as the patient enters the examining room. Does the patient’s head move naturally with their body movements? If they hold their head stiffly to one side it could be to protect an area of pain. The neck region should then be inspected for any abnormalities such as blisters, scars and discoloration.', notes: '')
lumbar_spine             = Component.create(system: musculoskeletal, name: 'Lumbar Spine', inspection: 'Anterior, posterior, lateral aspects of patient’s posture, ability to stand erect, symmetry, lordosis, discoloration, swelling, masses, muscular hypertrophy, atrophy, or spasms.', notes: '')
shoulder                 = Component.create(system: musculoskeletal, name: 'Shoulder', inspection: 'Notice any deformity, swelling, and asymmetry.  Remember to inspect the clavicle, the deltoids, and the scapula.  Notice whether the spine is straight, while looking for a lateral curvature (scoliosis).  Remember that this is considered a ball-and-socket joint.', notes: '')
elbow                    = Component.create(system: musculoskeletal, name: 'Elbow', inspection: 'Notice whether or not the patient has any deviations of the carrying angle between the humerus and the radius while the arm is passively extended with the palm forward.  Normally, the carrying angle is between 5 and 15 laterally (men usually have about a 5 carrying angle, while women usually have around a 15 carrying angle). The elbow is also classified as a hinge joint. Look for any swelling of the olecranon bursa or presence of nodules', notes: '')
wrist_and_hand           = Component.create(system: musculoskeletal, name: 'Wrist and Hand', inspection: 'Inspect the hand for any masses, lesions, nodules, discolorations, contour, position, shape, and completeness of the digits. Inspect both the palmar creases.  Remember to inspect both the palmar and dorsal surfaces of the hand.  Inspect the fingernails for spooning or clubbing', notes: '')
hip                      = Component.create(system: musculoskeletal, name: 'Hip', inspection: 'Examine the hip while the patient is walking, standing, and lying down.  Remember that this is considered a ball-and-socket joint and that movement is allowed in all planes', notes: '')
knee                     = Component.create(system: musculoskeletal, name: 'Hip', inspection: 'Observe the lower leg alignment.  The angle between the femur and the tibia is expected to be about 15°.  This is considered a hinge joint, thus flexion and extension are both allowed. Variations: Genu valgum (or valgus):  “Knock knees"; Genu varus (or varum):  “Bowlegged"; Genu recurvatum:  Excessive hyperextension of the knee with weight bearing; may indicate weakness of the quadriceps muscles', notes: '')
ankle_foot               = Component.create(system: musculoskeletal, name: 'Ankle/Foot', inspection: 'Examine the patient standing, walking, and then sitting.  Examine for swelling, deformities, number and position of toes, straightness, flatness, and proportion of toes when compared to the other foot.  Lastly, this is considered a hinge joint.', notes: 'Variations: Pes cavus:  Abnormally high arch; Pes planus:  Arch flatter than normal; Pes varus:  In toeing; Pes valgus:  Out toeing')
heent_component          = Component.create(system: heent, name: 'Head, Ears, Nose, Neck, Throat', inspection: 'To properly inspect the head, make sure your patients head is straight. Inspect for position, symmetry, and abnormal movements. Inspect hair for parasites, color, texture, and distribution. Inspect the cranium for size, shape, symmetry, lesions, scaliness, and tenderness. Inspect the face for shape, symmetry while at rest, moving, during expressions, and tics. Inspect sinuses. To inspect the neck, check the neck\'s position, symmetry alignment of trachea, tracheal tugging, fullness, masses, webbing, skin folds, and vascular prominence. Inspect the thyroid gland by placing the neck into mild extension, then observe swallowing and visualize the gland\'s size, symmetry, and contour as it moves. Inspect salivary glands for swelling. To inspect the ears externally, inspect each auricle and mastoid looking for size, shape, symmetry, erythema, edema, exudates, deformities, and skin lesions. Inspect the auditory canal for color, cerumen, discharge, foreign bodies, and lesions. For internal inspection, begin by pulling on the auricle in order to straighten the auditory canal. Examine the left ear with your left and the right ear with your right hand. Place the ulnar surface of your hand against the patient\'s head to stabilize the otoscope. Insert the otoscope 2/3 of the way into the canal taking care not to touch the wall and repeat for the opposite side. For external nose inspection, check the external surface for size, symmetry, and color. Inspect the nares for size, shape, symmetry, and discharge. For internal inspection, check the nasal mucosa for color and discharge. Inspect the septum for alignment, perforation, bleeding, crusting, masses. and polyps. Inspect the inferior and middle turbinates for color and consistency. To inspect the oropharynx, check the lips for color, symmetry, edema, and lesions. Inspect the teeth for occlusions, missing teeth, loose teeth, and surface abnormalities. Inspect the buccal mucosa for color, texture, and moisture. Inspect the gingivae for color, symmetry, swelling, coating, ulcerations, and size. Inspect the salivary glands. Inspect tonsillar placement, color, size, crypts, cratering, and exudates. Inspect uvula location. Inspect for drainage and irritation in the posterior oropharynx.s', notes: '')
cardiovascular_component = Component.create(system: cardiovascular, name: 'Cardiovascular', inspection: 'Ensure that this is always conducted on bare skin! Check the vascular system for skin color changes, hair distribution, and skin lesions. Inspect the chest for symmetry, pectus excavatum, pectus carinatum, pulsations, heaves/lifts, and apical impulse. Inspect the skin for cyanosis, bruising, venous distention, and tattoos. Inspect the nails for clubbing, spooning, splinter hemorrhages, beau lines, and cyanosis.	', notes: '')
respiratory_component    = Component.create(system: respiratory, name: 'Respiratory', inspection: 'Immediately determine whether or not your patient is in respiratory distress. Signs of Respiratory Distress: Tachypnea, Difficult or labored breathing, Diaphoresis, Accessory muscle usage/retractions, Cyanosis, Mental status, Grunting, Tripoding (patient is bent over or forward and leaning on their knees), Nasal flaring , Lip pursing. Check for color, edema, symmetry, lesions, and deformities. Note the shape and symmetry from the front, side, and back of the chest. Observe the bony skeleton, and compare the anterior/posterior diameter with the lateral diameter. Check for congenital variations including Pectus Excavatum, Pectus Carinatum, Barrel Chest, Flail Chest, Scoliosis, and Kyphosis. Observe the rate, rhythm, and depth of respiration. It is important that the patient is unaware that you are counting their respirations. Expected rate for adults is 12-20 respirations per minute. Abnormalities include the chest wall caving between the bony parts of the rib during respiration, and the lower thorax moving in on inspiration and expanding on expiration.	', notes: '')
neurological_component   = Component.create(system: neurological, name: 'Neurological', inspection: '', notes: '')
abdomen_component        = Component.create(system: abdomen, name: 'Abdomen', inspection: '', notes: '')
vital_signs_component    = Component.create(system: vitalsigns, name:'Vital Signs', inspection:'', notes:'')

puts 'Done'

# Palpations
print 'Seeding Palpations...'

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

Palpation.create(component: cardiovascular_component, structure:'Apical Impulse [PMI]', details:'Palpate at the 5th intercostal space, left mid-clavicular line. Determine the width in which you can palpate the PMI. Abnormalities include PMI shifting lateral and downward in left ventricular hypertrophy, heaves/lifts, thrill, faint PMI, and cardiomegaly. Ensure that the following pulses are palpated one at a time: Carotid, Brachial, Radial, Femoral, Popliteal, Dorsalis pedis, Posterior tibial. Note skin temperature and turgor.', notes:'The grading of the pulses is as follows: [4 - Bounding, aneurysmal], [3 - Full, increased], [2 - Expected], [1 - Diminished, barely palpable], [0 - Absent, not palpable].')
Palpation.create(component: cardiovascular_component, structure:'Precordium', details:'Use either the proximal halves of four fingers or your entire hand. Touch skin lightly and let the cardiac movements touch your hand.', notes:'Sequence: 1. Apex of the heart 2. Left sternal border 3. Base of the heart 4. Right sternal border 5. Epigastrium and axilla')
Palpation.create(component: cardiovascular_component, structure:'Landmarks', details:'Suprasternal notch, Xiphoid process, Angle of Louis, Ribs and intercoastal spaces, Manubrium, Sternum', notes:'')

Palpation.create(component: respiratory_component, structure:'Chest Excursion', details:'Stand behind the patient and place your hands flat against the patient\'s back with thumbs parallel to the midline around the level of the 10th ribs. Pull the skin slightly toward the midline and ask the patient to inhale deeply. Repeat facing the patient, placing thumbs along the costal margin to the xiphoid process.', notes:'Hand movement should be symmetric. Decreased symmetry can indicate a lung problem. Excursion is decreased in a barrel chest.')
Palpation.create(component: respiratory_component, structure:'Sternum', details:'Bony Palpation', notes:'')
Palpation.create(component: respiratory_component, structure:'Ribs', details:'Bony Palpation', notes:'')
Palpation.create(component: respiratory_component, structure:'Tracheal Position', details:'Place the right index finger in the suprasternal notch. Move laterally to feel the location of the trachea. Repeat to the opposite side.', notes:'Space between the trachea and clavicle on each side should be equal. Deviation indicates a problem with the chest. Causes are thyroid enlargement, fibrosis, tumor, atelectasis, and tension pneumothorax.')
Palpation.create(component: respiratory_component, structure:'Crepitus', details:'Place your fingertips in the intercostal spaces during respiration. Feel and listen for crackly sensations/sounds.', notes:'Crackly sensations or sounds indicate air in the subcutaneous tissue. Subcutaneous emphysema causes include respiratory system rupture, improper intubation inflation, infiltration with gas producing bacteria.')
Palpation.create(component: respiratory_component, structure:'Pleural Friction Rub', details:'Place your fingertips in the intercostal spaces during respiration. Feel for a grating vibration.', notes:'Suggestive of inflammation of the pleural surface.')
Palpation.create(component: respiratory_component, structure:'Tactile Fremitus', details:'Palpate the chest wall while an individual is talking. Use the Karate Chop technique by placing the ulnar side of the hand against the patient\'s chest wall as the patient repeats "99". Use the Piano technique by placing the palmar surface of the fingertips against the patient\'s chest wall as the patient repeats "99". Palpate both sides simultaneously or with one hand at a time. Test anterior, posterior, and lateral chest wall.', notes:'Increase fremitus is increased sound transmission from fluid or a solid mass and is caused by conditions that increase density of the lungs. Decrease fremitus is decreased sound transmission from excessive air obstruction.')

Palpation.create(component: heent_component, structure:'Oropharynx', details:'With a gloved finger, palpate the gingivae for tenderness, swelling, masses, lesions, and thickening. Palpate sublingual area for stones.', notes:'')
Palpation.create(component: heent_component, structure:'Sinuses', details:'Palpate or gently percuss the frontal and maxillary sinus area.', notes:'')
Palpation.create(component: heent_component, structure:'Nose', details:'Palpate the nose for masses, tenderness, and displacement of cartilage or bone.', notes:'')
Palpation.create(component: heent_component, structure:'Neck - Posterior Approach', details:'Position 2 fingers on the sides of the trachea below the cricoid cartilage. Flex and sidebend the patient\'s head and neck towards the side your are examining. Ask the patient to swallow while you feel movement of the thyroid isthmus. Next, displace the trachea to the left with the first three fingers of your right hand. Palpate the left lobe of the thyroid with the first three fingers of your left hand placed just medial to the sternocleidomastoid muscle as the patient swallows. Reverse for the right lobe.', notes:'')
Palpation.create(component: heent_component, structure:'Head and Scalp', details:'Palpate the head in a rotatory movement from front to back assessing for symmetry and tenderness. Palpate the hair assessing for texture, color, and distribution. Palpate over the temporal artery for thickening, hardness, and tenderness. Palpate over the salivary glands for enlargement and tenderness.', notes:'')
Palpation.create(component: heent_component, structure:'Ear', details:'Palpate the auricle, tragus, and mastoid process for tenderness, swelling, and nodules. Gently tug the tragus and lobe to assess mobility and tenderness.', notes:'')
Palpation.create(component: heent_component, structure:'Neck', details:'Palpate the occipital, posterior auricular, pre-auricular, submandibular, sublingual, submental, anterior cervical, posterior cervical, and supraclavicular lymph nodes. Palpate the neck for masses and range of motion. Palpate the hyoid bone, thyroid cartilage, and cricoid cartilage for movement with swallowing. Palpate the trachea by placing each of your thumbs along the sides of the trachea below the thyroid isthmus, compare the space between the trachea and the sternocleidomastoid muscles, and the spaces should be equal. Palpate for tracheal pulling by placing your thumb and forefinger of one hand on each side of the trachea below the thyroid isthmus and assess for a tugging sensation that is synchronous with the pulse. Palpate the thyroid gland by having the neck slightly flexed and bent toward the side being examined. Gently palpate over the gland for symmetry, size tenderness, consistency, and masses. Ask your patient to swallow a mouthful of water while you assess movement of the thyroid gland. Refer to the Anterior or Posterior palpation for further direction.', notes:'')
Palpation.create(component: heent_component, structure:'Neck - Anterior Approach', details:'Place your thumb over the trachea 3cm below the prominence of thyroid cartilage and identify the isthmus when swallowing. Flex and sidebend the patient\'s head and neck towards the side you are examining. To examine the left lobe stand at the patient\'s left side, press the trachea toward the left with your left thumb placed vertically on the neck. Next, place the first three fingers of your right hand in the thyroid bed with your fingertips medial to the sternocleidomastoid muscle. Ask the patient to swallow while you palpate the thyroid gland moving beneath your fingers. Reverse for the right lobe.', notes:'')


puts 'Done'

# Ranges of Motion
print 'Seeding Ranges Of Motion...'

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

puts 'Done'

# Muscles
print 'Seeding Muscles...'

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

puts 'Done'

# Special Tests
print 'Seeding Special Tests...'

spurling_test                = SpecialTest.create(component: cervical_spine, name: 'Spurling\'s Test', positive_sign: 'Radiating pain', indication: 'Nerve root impingement', how_to: 'In a patient with neck pain or pain that radiates below the elbow, this test helps confirm nerve root involvement. Slightly extend spine with rotation and sidebending toward the involved side and axial compression will often exacerbate nerve root impingement. A positive test is pain.')
compression_distraction_test = SpecialTest.create(component: cervical_spine, name: 'Compression and Distraction Tests', positive_sign: 'Reproduction of pain and relief of pain', indication: 'Issue with the cervical spine that warrants further investigation', how_to: 'In a patient with neck pain or pain that radiates below the elbow, a useful maneuver to further evaluate the cervical spine is the compression test. The patient\'s cervical spine is placed in slight extension. An axial load is then placed on the spine. Reproduction of the patient\'s shoulder or arm pain indicates possible cervical nerve root compression and warrants further evaluation of the bony and soft tissue structures of the cervical spine. Distracting the spine by putting the open palm of one hand under the patient’s chin and the other hand at the occiput and lifting the head will often relieve pain by widening the neural foramen.')
straight_leg_raising_test = SpecialTest.create(component: lumbar_spine, name: 'Straight Leg Raising Test', positive_sign: 'Radiating pain below the knee', indication: 'Nerve root irritation or lumbar disc herniation', notes:'Tests for nerve root irritation of lumbar disk herniation.', how_to: 'Have the patient lie supine with the neck slightly flexed. Lift the leg upward by supporting the foot around the calcaneus. The knee should remain straight as you do this. No pain should be felt below the knee with leg raising. Many people may experience pain during this, but is it sciatic nerve pain or hamstring tightness? Sciatic nerve pain will extend down the whole leg, whereas hamstring tightness will involve only the posterior thigh. Flexion of the knee often eliminates the pain with leg raising (due to hamstring tightness). Repeat the procedure on the unaffected leg. Crossover pain in the affected leg with this maneuver is more supportive of the finding of tension on the nerve roots.')
femoral_stretch_test      = SpecialTest.create(component: lumbar_spine, name: 'Femoral Stretch Test', positive_sign: 'Pain', indication: 'Nerve root compression at L1-L3', how_to:'patient prone, extend leg, pain is sign of nerve root compression often at L1-L3.')

apley_scratch_test = SpecialTest.create(component: shoulder, name: 'Apley Scratch Test', positive_sign: '', indication: '', notes:'', how_to: 'This is the quickest active way to evaluate a patient’s range of motion.  First, to test abduction and external rotation, ask the patient to reach behind their head and touch the superior medial angle of the opposite scapula.  Then to test internal rotation and adduction, have the patient reach behind their back to touch the inferior angle of the opposite scapula.  This is a good screening test for adhesive capsulitis (frozen shoulder).  A mnemonic to use for this is “Ab Ex and Ad In” [abduction/external rotation and adduction/internal rotation]')
yergason_test      = SpecialTest.create(component: shoulder, name: 'Yergason Test', positive_sign: 'Tendon pops out of the groove or if pain occurs upon palpation', indication: 'Instability of biceps tendon or tendonitis',notes:'', how_to: 'This test evaluates the stability of biceps tendon in the bicipital groove.  To perform the test, palpate the long head of the biceps brachii tendon.  Next, flex the patients forearm at a right angle, and stabilize the elbow.  Then, have the patient externally rotate the forearm against resistance.  A positive test occurs if the tendon pops out of the groove.  Repeat, but supinate the forearm instead.  Tenderness at the groove is a sign of tendonitis')
drop_arm_test      = SpecialTest.create(component: shoulder, name: 'Drop Arm Test', positive_sign: 'Cannot hold the arm and it drops', indication: 'Rotator cuff injury, especially the supraspinatus muscle', notes:'', how_to: 'This test helps to determine whether there is a tear in the rotator cuff, especially by the supraspinatus muscle tendon.  If a tear is present, patients can no longer control motion.  To test, have patient fully abduct their arm, and then ask them to slowly lower the arm.  While the arm is in abduction, gently push down on the arm. A positive test occurs when the patient cannot hold the arm and it drops (thus the name).')
neer_test          = SpecialTest.create(component: shoulder, name: 'Neer Test', positive_sign: 'Pain', indication: 'Rotator cuff inflammation or tear', notes:'', how_to:'To perform this test have the patient internally rotate the shoulder and then forward flex the patients arm up to 150°.  This will then press the supraspinatus muscle against the acromion.  If the patient experiences increased shoulder pain with this maneuver, then they are most likely having impingement of the muscles due to rotator cuff inflammation or a tear.')
hawkins_test       = SpecialTest.create(component: shoulder, name: 'Hawkins-Kennedy Test', positive_sign: 'Pain', indication: 'Rotator cuff tear or impingement', notes:'', how_to: 'Flex elbow to 90°, abduct the arm to 90°, and internally rotate humerus.  Pain indicates rotator cuff tear or impingement.')
supraspinatus_test = SpecialTest.create(component: shoulder, name: 'Supraspinatus Test/Empty Can Test', positive_sign: 'Pain', indication: 'Rotator cuff injury or supraspinatus tendonitis', notes:'', how_to: 'Have patient abduct 90°, flex their arm 30°, and hold it like they are holding an empty can.  See whether or not they can withstand holding their arm up. A positive test occurs in rotator cuff injury or supraspinatus tendonitis')
apprehension_test  = SpecialTest.create(component: shoulder, name: 'Apprehension Test', positive_sign: 'Patient exhibits fear and apprehension during test', indication: 'Anterior shoulder subluxation', notes:'', how_to: 'This test is used when you are dealing with a possible subluxation of the anterior shoulder.  To test, have the patient abduct their shoulder and externally rotate it.  Then push the shoulder posterior to anterior while further externally rotating arm.  A positive test occurs when the patient exhibits fear and apprehension when you are pushing.')
jerk_test          = SpecialTest.create(component: shoulder, name: 'Jerk Test', positive_sign: 'Subluxation or dislocation occurs', indication: 'Posterior shoulder subluxation', notes:'', how_to: 'Internally rotate the arm and flex at 90° with the elbow flexed to 90°.  Push the humerus posteriorly at the elbow.  The test is positive if subluxation or dislocation occurs.')
sulcus_test        = SpecialTest.create(component: shoulder, name: 'Sulcus Test', positive_sign: 'Widening of the sulcus between the humerus and acromion', indication: 'Inferior shoulder subluxation', notes:'', how_to: 'Pull down on the arm while relaxed at the patient’s side.  If subluxation occurs there will be widening of the sulcus between the humerus and acromion.')

ligamentous_stability_test = SpecialTest.create(component: elbow, name: 'Ligamentous Stability Test', positive_sign: 'Excessive gapping with valgus or varus stress', indication: 'Instability of the medial collateral ligament or the lateral collateral ligament of the elbow', notes: 'This is to determine the stability of the medial and lateral collateral ligaments of the elbow.', how_to:'To conduct this test, cup the posterior aspect of the patient’s elbow in one hand and hold their forearm with the other.  Your hand on the elbow will act as a fulcrum around which your other hand will force the forearm during the test.  First, instruct the patient to flex their elbow a few degrees as you force the forearm laterally, producing a medial (valgus) stress on the joint’s medial side.  Notice if there is any gapping on the medial side underneath your hand.  Then, reverse direction and push the forearm medially, producing a lateral (varus) stress on the joint’s lateral side.  Again, inspect for any gapping on the lateral side.  Your hand, in its position on the elbow, acts not only as a stabilizer and a fulcrum, but also as a means for palpating the collateral ligaments during the test.')
tinels_sign                = SpecialTest.create(component: elbow, name: 'Tinel\'s Sign', positive_sign: 'Tingling sensation down the forearm to the ulnar distribution of the hand', indication: 'Ulnar nerve entrapment', notes: 'The Tinel\'s sign at the elbow is checking for the irritation or entrapment of the ulnar nerve as it passes through the ulnar groove.  The Tinel’s sign at the wrist checks the median nerve.', how_to:'To perform this test locate the groove between the olecranon and the medial epicondyle and tap over the ulnar nerve as it passes through this groove.  A positive test is a tingling sensation down the forearm to the ulnar distribution of the hand')
tennis_elbow_test          = SpecialTest.create(component: elbow, name: 'Tennis Elbow Test/Cozen\'s Sign', positive_sign: 'Severe pain at the lateral epicondyle', indication: 'Lateral epicondylitis', notes:'', how_to: 'Instruct the patient to pronate the forearm with the elbow bent.  Then ask the patient to make a fist and extend the wrist.  The examiner holds the elbow and attempts to flex the hand while the patient is resisting in extension.  If the patient has tennis elbow, they will experience a sudden severe pain at the site of the wrist extensors’ common origin, the lateral epicondyle (lateral epicondylitis is occurring)')

flexor_digitorum_superficialis = SpecialTest.create(component: wrist_and_hand, name: 'Flexor Digitorum Superficialis', positive_sign: '', indication: '', notes: 'This muscle flexes the phalanges at the PIP.', how_to:' To perform this test hold the patient’s fingers in extension, except for the finger being tested.  This isolates the flexor digitorum superficialis tendon. Then instruct the patient to flex the finger in question at the PIP joint')
flexor_digitorum_profundus     = SpecialTest.create(component: wrist_and_hand, name: 'Flexor Digitorum Profundus', positive_sign: '', indication: '', notes: 'This muscle flexes the phalanges at the DIP.', how_to:' To test, isolate the DIP joint by stabilizing the metacarpophalangeal and interphalangeal joints in extension.  Then ask the patient to flex his finger at the DIP joint.  If they are able to do so, the tendon is functional.  If they cannot, the tendon may be cut or the muscle denervated')

allen_test                 = SpecialTest.create(component: wrist_and_hand, name: 'Allen Test', positive_sign: 'Release of ulnar artery does not return hand back to expected color (documented as a negative Allen test)', indication: 'Ulnar artery insufficiency (do not perform ABG on that radial artery)', notes: 'This is to test the patency of the ulnar artery.', how_to: 'Compress both the ulnar and radial arteries simultaneously, then release the ulnar to see if hand turns back to normal color.  If not, you should suspect ulnar artery insufficiency.  DO NOT TAKE ARTERIAL BLOOD GASES (ABGs). With the patient’s palm facing upwards, compress the radial and the ulnar artery with your thumbs. Have the patient open and close the fist 5 times before leaving the blanched palm open. Release pressure on the ulnar artery alone and watch for palmar reperfusion within 4-5 seconds.')
wrist_and_hand_tinels_sign = SpecialTest.create(component: wrist_and_hand, name: 'Tinel\'s Sign', positive_sign: 'Tingling sensation in the median distribution of the hand', indication: 'Median nerve entrapment', notes:'', how_to: 'Tap on the median nerve at the wrist right above the flexor retinaculum.  A positive test is when there is the presence of paresthesia in the 1st digit, 2nd digit, 3rd digit, and ½ of the 4th digit')
phalens_test               = SpecialTest.create(component: wrist_and_hand, name: 'Phalen\'s Test', positive_sign: 'Tingling sensation in the median distribution of the hand', indication: 'Median nerve entrapment', notes:'', how_to: 'Performed by flexing the patient’s wrist to its maximum degree and holding it in that position for at least a minute.  A positive test is when there is the presence of paresthesia in the 1st digit, 2nd digit, 3rd digit, and ½ of the 4th digit')

trendelenburg_test = SpecialTest.create(component: hip, name: 'Trendelenburg Test', positive_sign: 'Iliac crest drops on the side of the lifted leg', indication: 'Hip abductors on the weight bearing side are weak', notes: 'Tests for weak abductor muscles.', how_to: 'Ask the patient to stand and balance on one foot.  Observe the patient from behind and determine whether or not there is any asymmetry or change in the level of the iliac crest.  If the iliac crest drops on the side of the lifted leg, then the hip abductor muscles on the weight bearing side are weak. Repeat with the other side')
thomas_test        = SpecialTest.create(component: hip, name: 'Thomas Test', positive_sign: 'Normal flexion of one hip and approximately 15 degrees of flexion contracture of the other hip', indication: 'Tight iliopsoas muscle', notes: 'Tests for flexion contractures of the hip.', how_to:'Have the patient lie in the supine position and flex the left leg as far as it will go. The test is positive when there is normal flexion of the left leg and there is about 15° of flexion contracture on the right hip (due to a tight iliopsoas muscle) [could also occur in opposite direction as well].  Repeat with the other side. Ask the patient to lie supine and then place your had over their lower right thigh while the patient flexes the hip against your resistance')
faber_test         = SpecialTest.create(component: hip, name: 'Patrick Test/FABER Test', positive_sign: 'Pain in the groin, anterior thigh, or trochanteric region or pain in the ipsilateral SI joint', indication: 'Hip joint pathology or SI joint disorder', notes: 'Used to detect pathology in the hip, as well as in the sacroiliac joint.', how_to:'Have the patient lie supine on the table and place the foot of their involved side on his opposite knee.  The hip joint is now flexed, abducted, and externally rotated.  To stress the SI joint, extend the range of motion by placing one hand on the flexed knee joint and the other hand on the ASIS of the opposite side, press down on each of these points as if you were opening the binding of a book. The presence of muscle spasm, limitation of motion, or pain felt in the groin, anterior thigh, or trochanteric region indicates hip joint pathology such as osteoarthritis.  In contrast, pain in the ipsilateral SI joint indicates SI joint disorder, such as sacroiliitis.')

lateral_ligament_stability_test = SpecialTest.create(component: knee, name: 'Lateral Ligament Stability Test', positive_sign: 'Abnormal lateral movement or abnormal medial movement', indication: 'Instability of the medial collateral ligament or lateral collateral ligament of the knee', notes: 'Tests stability of the lateral collateral ligament.', how_to:'Have the patient lie supine with the knee nearly extended. Grasp the medial aspect of the knee and pull the ankle of the same side medially. Abnormal lateral movement is a positive test')
medial_ligament_stability_test  = SpecialTest.create(component: knee, name: 'Medial Ligament Stability Test', positive_sign: 'Abnormal lateral movement or abnormal medial movement', indication: 'Instability of the medial collateral ligament or lateral collateral ligament of the knee', notes: 'Tests stability of medial collateral ligament.', how_to:'Have the patient lie supine with the knee nearly extended.  Grasp the lateral aspect of the knee and pull the ankle of the same side laterally.  Abnormal medial movement is a positive test.')
anterior_drawer_test            = SpecialTest.create(component: knee, name: 'Anterior Drawer Test', positive_sign: 'Abnormal forward mobility of 2 cm or more', indication: 'Anterior cruciate ligament tear', notes: 'Tests for anterior cruciate ligament tear.', how_to:'With the patient supine, have the patient flex the knee to 45-90°.  Stabilize the leg by sitting gently on the patient’s foot.  Then grasp the leg just below the knee with both hands and jerk the tibia forward.  Abnormal forward mobility of 2 cm or more is a positive test')
posterior_drawer_test           = SpecialTest.create(component: knee, name: 'Posterior Drawer Test', positive_sign: 'Abnormal backward mobility of 2 cm or more', indication: 'Posterior cruciate ligament tear', notes: 'Tests for posterior cruciate ligament tear.', how_to:'With the patient supine, have the patient flex the knee to 45-90°.  Stabilize the leg by gently sitting on the patient’s foot.  Then, grasp the leg just below the knee with both hands and push the tibia posteriorly.  Abnormal backward mobility of 2 cm or more is a positive test')
lachmans_test                   = SpecialTest.create(component: knee, name: 'Lachman\'s Test', positive_sign: 'Increased laxity in the anterior cruciate ligament', indication: 'Anterior cruciate ligament tear', notes: 'Tests for anterior cruciate ligament tear.', how_to:'Have the patient lie supine with the extremity to be tested next to the examiner. The knee is positioned between 20 and 30° flexion.  Stabilize the distal lateral femur with one hand and grasp the medial proximal tibia with the other hand with the fingers posterior and the thumbs anterior and medial.  Apply a pressure through the fingers and the palm of the hand that translates the tibia anteriorly.  The test is positive when there is increased laxity in the anterior cruciate ligament.')
ballottement_test               = SpecialTest.create(component: knee, name: 'Ballottement Test', positive_sign: 'Patella rebounds when pushed down', indication: 'Excess fluid or an effusion in the knee', notes: 'Tests for excess fluid or an effusion in the knee.', how_to:'When the joint is distended by a large effusion, carefully extend the patient’s knee and instruct him/her to relax the quadriceps muscles.  Then, push the patella into the trochlear groove and quickly release it.  The large amount of fluid lying under the patella is first forced to the sides of the joint and then flows back to its former position, forcing the patella to rebound.  This is referred to as a ballotable patella')
mcmurray_test                   = SpecialTest.create(component: knee, name: 'McMurray Test', positive_sign: 'Palpable or audible click within the joint', indication: 'Medial or lateral meniscus tear', notes: 'Tests for a meniscal tear.',how_to:'During knee flexion and extension, a torn meniscus may produce a palpable or audible “clicking” in the region of the joint line.  Ask the patient to lie supine with their legs flat and in the neutral position.  With one hand, take hold of their heel and flex the leg fully.  Then, place your free hand on the knee joint with your fingers touching the medial joint line and your thumb and thenar eminence against the lateral joint line, and rotate the leg internally and externally to loosen the knee joint.   Push on the lateral side to apply valgus stress to the medial side of the joint, while at the same time rotating the leg externally. Maintain the valgus stress and external rotation, and extend the leg slowly as you palpate the medial joint line.  If this maneuver causes a palpable or audible “click” within the joint, there is a probable tear in the medial meniscus.  Now repeat with internal rotation and varus strain to test the lateral meniscus.  Pain, grinding, and/or lack of extension are all positive signs')
apley_compression_test          = SpecialTest.create(component: knee, name: 'Apley Compression Test', positive_sign: 'Pain in the knee with compression', indication: 'Medial and/or lateral meniscus injury', notes: 'Tests for meniscal tear.',how_to:'Have the patient lie prone with the knee at a right angle.  Then, hold the plantar surface of the patient’s heel and apply a compressive force while internally and externally rotating the heel.  The test is positive when there is pain in the knee with compression')
apley_distraction_test          = SpecialTest.create(component: knee, name: 'Apley Distraction Test', positive_sign: 'Pain in the knee with distraction', indication: 'Medial and/or lateral collateral ligament of the knee injury', notes: 'Tests for medial and lateral collateral ligament injury.', how_to:'Have the patient lie prone with the knee at a right angle.  Then, cup one hand around the posterior heel and the place the other hand (or use your knee) at the distal end of the thigh.  Then pull up while preventing the femur from rising and externally and internally rotate the foot.  The test is positive when there is pain in the knee with distraction')

thompson_doherty_squeeze_test = SpecialTest.create(component: ankle_foot, name: 'Thompson-Doherty Squeeze Test', positive_sign: 'No plantarflexion occurs when the calf is squeezed', indication: 'Achilles tendon rupture', notes: 'Tests for ruptured Achilles tendon.', how_to:'Squeeze the calf and notice the motion of the foot.  Normally, squeezing produces plantarflexion.  A ruptured Achilles tendon produces little or no motion')
homans_sign_test              = SpecialTest.create(component: ankle_foot, name: 'Homan\'s Sign Test', positive_sign: 'Pain in the calf with dorsiflexion of the foot', indication: 'DVT', notes: 'Tests for DVT in the calf. Dorsiflex the foot. The test is positive when dorsiflexion elicits pain in the calf area.  (Sensitivity:  10-54%; Specificity:  38-89%).', how_to: 'Flex the supine patients leg/knee with one hand. Quickly dorsiflex the foot.')
ankle_drawer_sign_test        = SpecialTest.create(component: ankle_foot, name: 'Ankle Drawer Sign Test', positive_sign: 'Obvious extreme forward displacement of the entire foot on the tibia', indication: 'Anterior talofibular ligament injury', notes: 'Tests for disruption of anterior talofibular ligament.', how_to:'The following 3 things are necessary to detect a positive drawer sign; First:  the anterior and posterior muscles which actuate the ankle must be relaxed.  This achieved by having the patient in either the sitting or supine position with the knee flexed to 90°. Second:  the ankle must be positioned at 10 to 20°plantarflexion.  Third:  for right ankle testing, place left hand over anterior distal tibia proximal to ankle joint; place the right hand on the medial surface curving the fingers over the posterior calcaneus.  Pull forward on the heel while pushing posteriorly on the tibia.  Repeat with the left side.  A positive test is when there is obvious extreme forward displacement of the entire foot on the tibia (when compared to the contralateral side).')

capillary_refill_test      = SpecialTest.create(component: cardiovascular_component, name: 'Capillary Refill', positive_sign: 'Capillary refill time of longer than 2 seconds', indication: 'Dehydration or peripheral perfusion issue', notes: '', how_to: 'Blanch the nail bed by squeezing the nail bed for several seconds. Quickly release the pressure. Observe how long it takes the normal pink color to return. This should be 2 seconds or less. ')
pitting_edema_test         = SpecialTest.create(component: cardiovascular_component, name: 'Pitting Edema', positive_sign: 'Depression that does not rapidly refill and resume its original contour', indication: 'Edema, increased venous hydrostatic pressure, or heart failure', notes: 'If grading of pitting edema is not recalled a quick review of how to might not be a bad idea', how_to: 'Press your index finger over a bony prominence such as the tibia or the medial malleolus for several seconds. Quickly release pressure.')
moses_sign_test            = SpecialTest.create(component: cardiovascular_component, name: 'Bancroft/Moses\' Sign Test', positive_sign: 'Pain in the calf with anteroposterior compression', indication: 'DVT', notes: '', how_to: 'With your patient supine or seated, wrap your hand around the gastrocnemius muscle. Compress the gastrocnemius muscle against the tibia.')
allen_test_cardio          = SpecialTest.create(component: cardiovascular_component, name: 'Allen Test (Cardiovascular)', positive_sign: 'Release of ulnar artery does not return hand back to expected color (documented as a negative Allen test)', indication: 'Patency of ulnar artery before performing a radial artery puncture..	', notes: 'If there is a lack of palmar reperfusion, DO NOT PERFORM ABG OR CATHETER INSERTION!')
orthostatic_blood_pressure = SpecialTest.create(component: cardiovascular_component, name: 'Orthostatic Blood Pressure', positive_sign: 'A systolic blood pressure that decreases ≥ 20 mmHg OR a diastolic blood pressure that decreases ≥ 10 mmHg within 3 minutes of standing. Your patient may also complain of symptoms such as dizziness, euphoria, nausea, or headache. BE AWARE: Your patient may pass out!', indication: 'Hypovolemia, certain medications, Addison\'s disease, etc.', notes: '', how_to: 'Have your patient lie supine for 10 minutes. Take his/her blood pressure while supine. Have your patient stand. Take his/her blood pressure within 3 minutes of standing.')
cardiovascular_component.special_tests << homans_sign_test

chest_excursion_test        = SpecialTest.create(component: respiratory_component, name: 'Chest Excursion', positive_sign: 'Asymmetric movement of hands', indication: 'Problem with one or both lungs (usually decreased in a barrel chest)', notes: '', how_to:'Stand behind the patient. Place your hands flat against the patient’s back with the thumbs parallel to the midline at approximately the level of the 10th ribs. Pull the underlying skin slightly toward the midline. Ask the patient to inhale deeply. Repeat facing the patient, but this time place your thumbs along the costal margin to the xiphoid process.')
crepitus_test               = SpecialTest.create(component: respiratory_component, name: 'Crepitus Test', positive_sign: 'Crackly sensation or sound', indication: 'Presence of air in the subcutaneous tissue', notes: '', how_to:'Place your fingertips in the intercostal spaces during respiration. Feel and listen for a crackly sensation/sound.')
pleural_friction_rub_test   = SpecialTest.create(component: respiratory_component, name: 'Pleural Friction Rub Test', positive_sign: 'Grating vibration felt upon palpation', indication: 'Inflammation of the pleural space', notes: '', how_to:'Place your fingertips in the intercostal spaces during respiration. Feel for a grating vibration. It may feel like leather rubbing on leather.')
tactile_fremitus_test       = SpecialTest.create(component: respiratory_component, name: 'Tactile Fremitus Test', positive_sign: 'Increased or decreased sound transmission', indication: 'Increased sound transmission from fluid or a solid mass (i.e. tumor) or decreased sound transmission from excessive air (i.e. emphysema or bronchial obstruction)', notes: '', how_to:'Palpate the chest wall while an individual is talking. Palpate both sides simultaneously or with one hand at a time. Alternate from side to side. Test the anterior, posterior, and lateral chest wall (perform in all lung fields).')
bronchophony_test           = SpecialTest.create(component: respiratory_component, name: 'Bronchophony Test', positive_sign: 'Increased sound when the patient is asked repeat a phrase (“99, 99”)', indication: 'Consolidation', notes: '', how_to:'Patient repeats a phrase (i.e. “99”) while you auscultate the chest.')
whispered_pectoriloquy_test = SpecialTest.create(component: respiratory_component, name: 'Whispered Pectoriloquy Test', positive_sign: 'Increased sound that is louder and clearer when the patient is asked to whisper “1-2-3”', indication: 'Consolidation', notes: '', how_to:'Ask the patient to whisper “1-2-3” while you auscultate the chest.')
egophony_test               = SpecialTest.create(component: respiratory_component, name: 'Egophony Test', positive_sign: 'When patient is asked to say “E-E-E-E” it is heard as “A-A-A-A” (it is imperative that you ask the patient to repeat this as an individual sound and not as a continual one)', indication: 'Consolidation', notes: '', how_to:'Patient says “E-E-E-E” while you auscultate the chest.')

brudzinski_sign = SpecialTest.create(component: neurological_component, name: 'Brudzinski Sign Test', positive_sign: 'Nuchal pain with flexion of the hips and lower extremities', indication: 'Meningeal irritation (i.e. meningitis or intracranial hemorrhage)', notes: '', how_to:'Doctor forward bends the patient’s head and neck. Patient reports marked nuchal pain and hips and lower extremities flex.')
kernig_sign     = SpecialTest.create(component: neurological_component, name: 'Kernig Sign Test', positive_sign: 'Low back pain', indication: 'meningeal irritation (i.e. meningitis or intracranial hemorrhage)', notes: '', how_to:'Hip and knee are flexed and extension of the knee occurs. Low back pain and/or neck flexion occurs.')

murphys_sign               = SpecialTest.create(component: abdomen_component, name: 'Murphy\'s Sign', positive_sign: 'Pain and sudden halting of respiration', indication: 'Gallbladder inflammation', notes: '', how_to: 'Ask the patient to lie supine, place fingers under the right costal margin while pushing up and in on the liver, and ask patient to inhale while this is occurring')
shifting_dullness_test     = SpecialTest.create(component: abdomen_component, name: 'Shifting Dullness Test', positive_sign: 'Border of dullness shifts to the dependent side as the fluid resettles', indication: 'Ascites', notes: '')
fluid_wave_test            = SpecialTest.create(component: abdomen_component, name: 'Fluid Wave Test', positive_sign: 'Impulse through fluid is felt on the patient’s abdomen', indication: 'Ascites', notes: '')
rebound_tenderness_test    = SpecialTest.create(component: abdomen_component, name: 'Rebound Tenderness Test', positive_sign: 'Stabbing pain occurs with rapid withdrawal of hands', indication: 'Peritoneal inflammation', notes: 'Blumberg\'s Sign', how_to: 'With the patient supine, slowly press rigid fingers in an area remote from the pain and rapidly withdraw your hand')
iliopsoas_muscle_test      = SpecialTest.create(component: abdomen_component, name: 'Iliopsoas Muscle Test', positive_sign: 'Pain upon flexion of the right thigh against resistance', indication: 'Appendicitis', notes: '')
obturator_muscle_test      = SpecialTest.create(component: abdomen_component, name: 'Obturator Muscle Test', positive_sign: 'Pain upon flexion at the hip and knee with internal and external rotation of the right leg', indication: 'Appendicitis or pelvic abscess', notes: '', how_to: 'With the right leg flexed at the hip and knee, internally and externally rotate the leg')

aarons_sign_test           = SpecialTest.create(component: abdomen_component, name: 'Aaron’s Sign Test', positive_sign: 'Pain or distress occurs in the area of the patient’s heart or stomach on palpation of McBurney’s point', indication: 'Appendicitis', notes: '')
ballances_sign_test        = SpecialTest.create(component: abdomen_component, name: 'Ballance’s Sign Test', positive_sign: 'Fixed dullness to percussion in the left flank and dullness in right flank that disappears on position change', indication: 'Peritoneal irritation', notes: '')
cullens_sign_test          = SpecialTest.create(component: abdomen_component, name: 'Cullen’s Sign Test', positive_sign: 'Ecchymosis around the umbilicus', indication: 'Hemoperitoneum, pancreatitis, or ectopic pregnancy', notes: '')
dances_sign_test           = SpecialTest.create(component: abdomen_component, name: 'Dance’s Sign Test', positive_sign: 'Absence of bowel sounds in RLQ', indication: 'Intussusception', notes: '')
grey_turners_sign_test     = SpecialTest.create(component: abdomen_component, name: 'Grey Turner’s Sign Test', positive_sign: 'Ecchymosis of flanks', indication: 'Hemoperitoneum or pancreatitis', notes: '')
kehrs_sign_test            = SpecialTest.create(component: abdomen_component, name: 'Kehr’s Sign Test', positive_sign: 'Abdominal pain radiating to left shoulder', indication: 'Splenic rupture, renal calculi, or ectopic pregnancy', notes: '')
markles_sign_test          = SpecialTest.create(component: abdomen_component, name: 'Markle’s Sign Test', positive_sign: 'Pain when patient’s heels are struck', indication: 'Peritoneal irritation or appendicitis', notes: 'Heel Jar Sign')
mcburneys_point_test       = SpecialTest.create(component: abdomen_component, name: 'McBurney’s Point Test', positive_sign: 'Rebound tenderness and sharp pain when McBurney’s point is palpated', indication: 'Appendicitis', notes: '')
rovsings_sign_test         = SpecialTest.create(component: abdomen_component, name: 'Rovsing’s Sign Test', positive_sign: 'RLQ pain intensified by LLQ palpation', indication: 'Peritoneal irritation or appendicitis', notes: '')
howship_rombergs_sign_test = SpecialTest.create(component: abdomen_component, name: 'Howship-Romberg Sign Test', positive_sign: 'Pain down medial aspect of the thigh to the knee', indication: 'Strangulated obturator hernia', notes: '')

whisper_test               = SpecialTest.create(component: heent_component, name: 'Whisper Test', positive_sign: 'Inability to hear you whisper', indication:'decreased hearing', how_to:'Stand 1-2 feet behind the patient’s ear. Softly whisper “1-2-3”. Ask the patient to repeat what you said. Repeat for the other side', notes: '')
weber_test                 = SpecialTest.create(component: heent_component, name: 'Weber Test', positive_sign: 'lateralization of sound', indication: 'lateralization to the deaf ear in conductive hearing loss or lateralization to the hearing ear in sensorineural hearing loss', notes: '', how_to: 'Begin with the patient seated, Strike a tuning fork with your opposite hand. Place the vibrating fork in the center of the patient’s head. Ask the patient if the sound is heard equally in both ears')
rinne_test                 = SpecialTest.create(component: heent_component, name: 'Rinne Test', positive_sign: 'air conduction is less than 2x bone conduction', indication: 'if bone conduction is greater than air conduction the patient has conductive hearing loss and if air conduction is greater than bone conduction the patient has sensorineural hearing loss', notes: '', how_to:'Begin with the patient seated. Strike a tuning fork with your opposite hand. Place the base of the handle of the vibrating tuning fork on the patient’s mastoid bone. Ask the patient to tell you when sound is no longer heard (use a watch to keep time). Quickly move the tuning fork 1-2 cm away from the auditory canal. Ask the patient to tell you when sound is no longer heard. Air conduction should be heard for twice as long as bone conduction. Repeat on the opposite side')

componentname         = SpecialTest.create(component: vital_signs_component, name:'', positive_sign:'', indication:'', notes:'', how_to:'')
componentname         = SpecialTest.create(component: vital_signs_component, name:'', positive_sign:'', indication:'', notes:'', how_to:'')

puts 'Done'

# Exam Techniques
print 'Seeding Exam Techniques...'

systolic_murmur            = ExamTechnique.create(system: cardiovascular, name: 'Systolic Murmurs', details: 'No maneuver distinguishes this murmur, the diagnosis can be made by exclusion, clinical presentation, and physical exam')
mitral_regurgitation       = ExamTechnique.create(system: cardiovascular, name: 'Mitral Regurgitation', details: 'Hand grip enhances murmur')
aortic_regurgitation       = ExamTechnique.create(system: cardiovascular, name: 'Aortic Regurgitation', details: 'Accentuated by having the patient sit and lean forward')
mitral_stenosis            = ExamTechnique.create(system: cardiovascular, name: 'Mitral Stenosis', details: 'Accentuated by having the patient lie in left lateral decubitus')

tracheal_alignment         = ExamTechnique.create(system: heent, name: 'Tracheal Alignment', details: '')
otoscopic_exam             = ExamTechnique.create(system: heent, name: 'Otoscopic Exam', details: '')
internal_nasal_exam        = ExamTechnique.create(system: heent, name: 'Internal Nasal Exam', details: '')
sinus_palpation_percussion = ExamTechnique.create(system: heent, name: 'Sinus Palpation/Percussion', details: '')
lymph_node_palpation       = ExamTechnique.create(system: heent, name: 'Lymph Node Palpation', details: 'Occipital, Pre-Auricular, Posterior Auricular, Submandibular, Sublingual, Submental, Anterior Cervical, Posterior Cervical, Supraclavicular')
thyroid_exam_screening     = ExamTechnique.create(system: heent, name: 'Thyroid Exam Screening', details: 'Palpate both lobes of the thyroid at once during a single swallow to check briefly for thyromegaly, nodules, or masses')
thyroid_exam_formal        = ExamTechnique.create(system: heent, name: 'Thyroid Exam Formal', details: 'If you cannot recall how to conduct this exam, it would be a good idea to review both the anterior approach and the posterior approach, and select one that you feel most comfortable with')

mental_status_assessment            = ExamTechnique.create(system: neurological, name: 'Mental Status Assessment', details: '')
cn_ii_xii_testing                   = ExamTechnique.create(system: neurological, name: 'CN II-XII Testing', details: '')
muscle_strength_testing             = ExamTechnique.create(system: neurological, name: 'Muscle Strength Testing', details: '')
finger_nose_finger                  = ExamTechnique.create(system: neurological, name: 'Finger-Nose-Finger', details: '')
heel_to_shin                        = ExamTechnique.create(system: neurological, name: 'Heel-to-Shin', details: '')
rapid_alternating_movements         = ExamTechnique.create(system: neurological, name: 'Rapid Alternating Movements', details: '')
gait                                = ExamTechnique.create(system: neurological, name: 'Gait', details: 'Regular walk; Walk on toes; Walk on heels; Tandem gait')
romberg                             = ExamTechnique.create(system: neurological, name: 'Romberg', details: 'It is important to remember that a positive Romberg implies a proprioceptive or vestibular defect [an individual with a present cerebellar defect would have difficulty even prior to trying to begin a Romberg test')
sensory_exam_pain                   = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Pain', details: 'Pain and Temperature (lateral spinothalamic tracts)')
sensory_exam_light_touch            = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Light & Touch', details: 'Light Touch and Crude Touch (anterior spinothalamic tracts)')
sensory_exam_proprioception         = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Proprioception', details: 'Proprioception, Vibration, and Two Point Discrimination (posterior columns)')
sensory_exam_point_localization     = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Point Localization', details: '')
sensory_exam_texture_discrimination = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Texture Discrimination', details: '')
sensory_exam_stereognosis           = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Stereognosis', details: '')
sensory_exam_graphesthesia          = ExamTechnique.create(system: neurological, name: 'Sensory Exam: Graphesthesia', details: '')
deep_tendon_reflexes                = ExamTechnique.create(system: neurological, name: 'Deep Tendon Reflexe', details: 'Brachioradialis (C5-C6); Biceps (C5-C6); Triceps (C6-C7-C8); Patellar (L2-L3-L4); Achilles (S1-S2)')
plantar_toe_reflex                  = ExamTechnique.create(system: neurological, name: 'Plantar Toe Reflex', details: '')
plantar_toe_chaddock                = ExamTechnique.create(system: neurological, name: 'Plantar Toe Chaddock', details: '')
plantar_toe_achilles_reflex         = ExamTechnique.create(system: neurological, name: 'Plantar Achilles-Toe Reflex', details: '')
plantar_toe_shin_toe_reflex         = ExamTechnique.create(system: neurological, name: 'Plantar Shin-Toe Reflex', details: '')
plantar_toe_calf_toe_reflex         = ExamTechnique.create(system: neurological, name: 'Plantar Calf-Toe Reflex', details: '')
plantar_toe_pinprick_toe_reflex     = ExamTechnique.create(system: neurological, name: 'Plantar Pinprick Toe Reflex', details: '')

far_visual_activity              = ExamTechnique.create(system: eye, name: 'Far Visual Acuity', details: 'Snellen Chart')
near_visual_activity             = ExamTechnique.create(system: eye, name: 'Near Visual Acuity', details: 'Rosenbaum Chart')
confrontation_test               = ExamTechnique.create(system: eye, name: 'Confrontation Test', details: 'Peripheral Vision Test')
amsler_grid                      = ExamTechnique.create(system: eye, name: 'Amsler Grid', details: 'Central vision test')
color_plates                     = ExamTechnique.create(system: eye, name: 'Color Plates', details: 'Color vision assessment')
corneal_clarity                  = ExamTechnique.create(system: eye, name: 'Corneal Clarity', details: '')
corneal_reflex                   = ExamTechnique.create(system: eye, name: 'Corneal Reflex', details: 'Does not occur if the patient is wearing contacts')
pupillary_light_reflex           = ExamTechnique.create(system: eye, name: 'Pupillary Light Reflex', details: '')
accommodation                    = ExamTechnique.create(system: eye, name: 'Accommodation', details: '')
swinging_flashlight_test         = ExamTechnique.create(system: eye, name: 'Swinging Flashlight Test', details: '')
extraocular_muscle_movement_test = ExamTechnique.create(system: eye, name: 'Extraocular Muscle Movements', details: 'Assessment of the cardinal fields of gaze')
corneal_light_reflex_test        = ExamTechnique.create(system: eye, name: 'Corneal Light Reflex', details: '')
cover_uncover_test               = ExamTechnique.create(system: eye, name: 'Cover-Uncover Test', details: '')
ophthalmoscopic_exam             = ExamTechnique.create(system: eye, name: 'Ophthalmoscopic Exam', details: '')

puts 'Done'

# Video Links | Special Tests
print 'Seeding Video Links for Special Tests...'
VideoLink.create(special_tests: [], system_id:'musculoskeletal', title:'The Musculoskeletal Exam', link:'https://youtu.be/G-s1w7O-yaM')

VideoLink.create(special_tests: [spurling_test], system_id:'musculoskeletal', title: 'Spurling\'s Test', link: 'https://www.youtube.com/watch?v=VYENa1Dre10')
VideoLink.create(special_tests: [compression_distraction_test], system_id:'musculoskeletal', title: 'Cervical Compression and Distraction Test', link: 'https://www.youtube.com/watch?v=TnoJySUENAk')
VideoLink.create(special_tests: [straight_leg_raising_test], system_id:'musculoskeletal', title: 'Straight Leg Raising Test', link: 'https://www.youtube.com/watch?v=aL85pm7J6Io')
VideoLink.create(special_tests: [yergason_test], system_id:'musculoskeletal', title: 'Yergason Test', link: 'https://www.youtube.com/watch?v=uDrHy4Ob4yI')
VideoLink.create(special_tests: [drop_arm_test], system_id:'musculoskeletal', title: 'Drop Arm Test', link: 'https://www.youtube.com/watch?v=Jv3OzKNAyHQ')
VideoLink.create(special_tests: [neer_test], system_id:'musculoskeletal', title: 'Neer Test', link: 'https://www.youtube.com/watch?v=Gk9tOHSvW1A')
VideoLink.create(special_tests: [hawkins_test], system_id:'musculoskeletal', title: 'Hawkins Test', link: 'https://www.youtube.com/watch?v=nTXvtEx9t2w')
VideoLink.create(special_tests: [hawkins_test], system_id:'musculoskeletal', title: 'Hawkin\'s Kennedy Test', link: 'https://www.youtube.com/watch?v=8MyJwPvIvBg')
VideoLink.create(special_tests: [supraspinatus_test], system_id:'musculoskeletal', title: 'Supraspinatus Test', link: 'https://www.youtube.com/watch?v=lucHrTMP0QI')
VideoLink.create(special_tests: [apprehension_test], system_id:'musculoskeletal', title: 'Apprehension Test', link: 'https://www.youtube.com/watch?v=HvoZ92ZFn9c')
VideoLink.create(special_tests: [jerk_test], system_id:'musculoskeletal', title: 'Jerk Test', link: 'https://www.youtube.com/watch?v=pQq95HQboU4')
VideoLink.create(special_tests: [sulcus_test], system_id:'musculoskeletal', title: 'Sulcus Test', link: 'https://www.youtube.com/watch?v=sIhWzU1WtFs')
VideoLink.create(special_tests: [ligamentous_stability_test], system_id:'musculoskeletal', title: 'Ligamentous Stability Testing at the Elbow', link: 'https://www.youtube.com/watch?v=qOQKB-4hkMY')
VideoLink.create(special_tests: [tinels_sign], system_id:'musculoskeletal', title: 'Tinel\'s Sign at the Elbow', link: 'https://www.youtube.com/watch?v=Tk-w18_EjVk')
VideoLink.create(special_tests: [tennis_elbow_test], system_id:'musculoskeletal', title: 'Tennis Elbow Test', link: 'https://www.youtube.com/watch?v=ZmZVofLqZS4')
VideoLink.create(special_tests: [flexor_digitorum_superficialis, flexor_digitorum_profundus], system_id:'musculoskeletal', title: 'Long Finger Flexor Tests', link: 'https://www.youtube.com/watch?v=OStny5IhA6g')
VideoLink.create(special_tests: [allen_test], system_id:'musculoskeletal', title: 'Allen Test', link: 'https://www.youtube.com/watch?v=hLov_jwTBkg')
VideoLink.create(special_tests: [allen_test_cardio], system_id:'cardiovascular', title:'Allen Test (Cadiovascular)', link:'	https://www.youtube.com/watch?v=hLov_jwTBkg')
VideoLink.create(special_tests: [wrist_and_hand_tinels_sign], title: 'Tinel\'s Sign at the Wrist', link: 'https://www.youtube.com/watch?v=SuCVcsNUeJA')
VideoLink.create(special_tests: [phalens_test], system_id:'musculoskeletal', title: 'Phalen\'s Sign', link: 'https://www.youtube.com/watch?v=iPRG43m1_Vc')
VideoLink.create(special_tests: [trendelenburg_test], system_id:'musculoskeletal', title: 'Trendelenburg Test', link: 'https://www.youtube.com/watch?v=l07aYtKma_U')
VideoLink.create(special_tests: [thomas_test], system_id:'musculoskeletal', title: 'Thomas Test 1', link: 'https://www.youtube.com/watch?v=FNYm7zxjGMQ')
VideoLink.create(special_tests: [thomas_test], system_id:'musculoskeletal', title: 'Thomas Test 2', link: 'https://www.youtube.com/watch?v=rTPdKOqg0G8')
VideoLink.create(special_tests: [faber_test], system_id:'musculoskeletal', title: 'FABER Patrick Test', link: 'https://www.youtube.com/watch?v=ZRtgAcRDL1Y')
VideoLink.create(special_tests: [lateral_ligament_stability_test, medial_ligament_stability_test], title: 'Ligamentous Stability', link: 'https://www.youtube.com/watch?v=Xgn35yfqCdg')
VideoLink.create(special_tests: [anterior_drawer_test], title: 'Anterior Drawer Test', link: 'https://www.youtube.com/watch?v=fmsUE7gdkLQ')
VideoLink.create(special_tests: [posterior_drawer_test], title: 'Posterior Drawer Test', link: 'https://www.youtube.com/watch?v=DC0sQbtwF90')
VideoLink.create(special_tests: [lachmans_test], title: 'Lachman\'s Test', link: 'https://www.youtube.com/watch?v=F7-9eofB80U')
VideoLink.create(special_tests: [mcmurray_test], title: 'McMurray Test', link: 'https://www.youtube.com/watch?v=bJWpS_05QSA')
VideoLink.create(special_tests: [apley_compression_test], title: 'Appley Compression Test', link: 'https://www.youtube.com/watch?v=k2ZoJ6oUyNo')
VideoLink.create(special_tests: [apley_distraction_test], title: 'Appley Distraction Test', link: 'https://www.youtube.com/watch?v=k2ZoJ6oUyNo')
VideoLink.create(special_tests: [thompson_doherty_squeeze_test], system_id:'musculoskeletal', title: 'Thompson Doherty Squeeze Test', link: 'https://www.youtube.com/watch?v=71GG5-CT4GU')
VideoLink.create(special_tests: [homans_sign_test], system_id:'cardiovascular', title: 'Homan\'s Sign Test', link: 'https://www.youtube.com/watch?v=5-LCDB_PPYM')
VideoLink.create(special_tests: [ankle_drawer_sign_test], system_id:'musculoskeletal', title: 'Ankle Drawer Sign', link: 'https://www.youtube.com/watch?v=kfMgPb4SXjs')
VideoLink.create(special_tests: [moses_sign_test], system_id:'cardiovascular', title: 'Moses\' Sign', link: 'https://www.youtube.com/watch?v=b1oaLDj1u4Y')
VideoLink.create(special_tests: [chest_excursion_test], system_id:'respiratory', title: 'Chest Excursion', link: 'https://www.youtube.com/watch?v=8IjMjFSRmII')
VideoLink.create(special_tests: [tactile_fremitus_test], system_id:'respiratory', title: 'Tactile Fremitus', link: 'https://www.youtube.com/watch?v=NoJeTljJ-PQ')
VideoLink.create(special_tests: [bronchophony_test], system_id:'respiratory', title: 'Bronchophony', link: 'https://www.youtube.com/watch?v=NlfUy3yyAEs')
VideoLink.create(special_tests: [whispered_pectoriloquy_test], system_id:'respiratory', title: 'Whispered Pectoriloquy', link: 'https://www.youtube.com/watch?v=V761MusII1I')
VideoLink.create(special_tests: [egophony_test], system_id:'respiratory', title: 'Egophony', link: 'https://www.youtube.com/watch?v=VthSqLviduk')
VideoLink.create(special_tests: [brudzinski_sign], system_id:'neurological', title: 'Brudzinski Sign', link: 'https://www.youtube.com/watch?v=Pxo02mAgIvg')
VideoLink.create(special_tests: [kernig_sign], system_id:'neurological', title: 'Kernig Sign', link: 'https://www.youtube.com/watch?v=EV1HOuxJUjQ')
VideoLink.create(special_tests: [murphys_sign], system_id:'abdomen', title: 'Murphy\'s Sign', link: 'https://www.youtube.com/watch?v=Uk0zQUZphlI')
VideoLink.create(special_tests: [rebound_tenderness_test], system_id:'abdomen', title: 'Rebound Tenderness', link: 'https://www.youtube.com/watch?v=YYIoxjiBAV0')
VideoLink.create(special_tests: [iliopsoas_muscle_test], system_id:'abdomen', title: 'Iliopsoas Muscle Test', link: 'https://www.youtube.com/watch?v=-azrl9gRUMU')
VideoLink.create(special_tests: [obturator_muscle_test], system_id:'abdomen', title: 'Obturator Muscle Test', link: 'https://www.youtube.com/watch?v=k6Pznq4VYoE')
VideoLink.create(special_tests: [weber_test], system_id:'Head, Ears, Nose, Neck, Throat', title:'Weber Test', link:'https://www.youtube.com/watch?v=-gObukYTMP8')

puts 'Done'

# Video Links | Exam Techniques
print 'Seeding Video Links for Exam Techniques...'

VideoLink.create(exam_techniques: [aortic_regurgitation], title: 'Aortic Regurgitation', link: 'https://www.youtube.com/watch?v=aMRYU5hY03Y')
VideoLink.create(exam_techniques: [mitral_stenosis], title: 'Mitral Stenosis', link: 'https://www.youtube.com/watch?v=g60XNtXx-G0')
VideoLink.create(exam_techniques: [tracheal_alignment], title: 'Tracheal Palpation', link: 'https://www.youtube.com/watch?v=YMufMulGnFE')
VideoLink.create(exam_techniques: [otoscopic_exam], title: 'Otoscopic Examination', link: 'https://www.youtube.com/watch?v=0BJ2EP3TacU')
VideoLink.create(exam_techniques: [internal_nasal_exam], title: 'Marys Inspection', link: 'https://www.youtube.com/watch?v=L2rwY1Mud9Y')
VideoLink.create(exam_techniques: [sinus_palpation_percussion], title: 'Frontal and Maxillary Sinus Palpation and Percussion', link: 'https://www.youtube.com/watch?v=NO3H7DlTpS8')
VideoLink.create(exam_techniques: [lymph_node_palpation], title: 'Lymph Node Palpation', link: 'https://www.youtube.com/watch?v=t54mngOVKtM')
VideoLink.create(exam_techniques: [thyroid_exam_screening, thyroid_exam_formal], title: 'Thyroid Palpation Anterior Approach', link: 'https://www.youtube.com/watch?v=nh1DedZQJ3M')
VideoLink.create(exam_techniques: [thyroid_exam_screening, thyroid_exam_formal], title: 'Thyroid Palpation Posterior Approach', link: 'https://www.youtube.com/watch?v=DaDYqs4H92U')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerve I Olfactory', link: 'https://www.youtube.com/watch?v=HH7a-B7c0cM')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Visual Acuity Test Cranial Nerve II', link: 'https://www.youtube.com/watch?v=wl1hWJAnaYc')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerves III, IV, VI oculomotor, trochlear, abducens', link: 'https://www.youtube.com/watch?v=_gpKwikoZv4')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerve V trigeminal', link: 'https://www.youtube.com/watch?v=kOwJNTAZy5o')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerve VII facial', link: 'https://www.youtube.com/watch?v=eD46Mrk_9So')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerve VIII acoustic, vtibulocochlear, or auditory', link: 'https://www.youtube.com/watch?v=SUEZtGbxxXg')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerves IX and X glossopharyngeal and vagus', link: 'https://www.youtube.com/watch?v=IdRuasfki6U')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerve XI spinal accessory', link: 'https://www.youtube.com/watch?v=aRMBGPjtNLo')
VideoLink.create(exam_techniques: [cn_ii_xii_testing], title: 'Cranial Nerve XII hypoglossal', link: 'https://www.youtube.com/watch?v=u4Pd2IMFDfg')
VideoLink.create(exam_techniques: [finger_nose_finger], title: 'Finger Nose Finger', link: 'https://www.youtube.com/watch?v=2Buhkr5akMs')
VideoLink.create(exam_techniques: [heel_to_shin], title: 'Heel to Shin', link: 'https://www.youtube.com/watch?v=uEaTMysjSDA')
VideoLink.create(exam_techniques: [rapid_alternating_movements], title: 'Rapid Alternating Movements', link: 'https://www.youtube.com/watch?v=AA4E0nRik6M')
VideoLink.create(exam_techniques: [romberg], title: 'Romberg Test', link: 'https://www.youtube.com/watch?v=suxuiAcBEp4')
VideoLink.create(exam_techniques: [sensory_exam_pain], title: 'Sensory Exam Pain', link: 'https://www.youtube.com/watch?v=AR6Mg1qDCAs')
VideoLink.create(exam_techniques: [sensory_exam_light_touch], title: 'Sensory Exam Light Touch', link: 'https://www.youtube.com/watch?v=g6AYM6Hyaxg')
VideoLink.create(exam_techniques: [sensory_exam_proprioception], title: 'Proprioception', link: 'https://www.youtube.com/watch?v=0krCEry9_w8')
VideoLink.create(exam_techniques: [deep_tendon_reflexes], title: 'Reflexes', link: 'https://www.youtube.com/watch?v=f2viqFATRsY')
VideoLink.create(exam_techniques: [plantar_toe_reflex], title: 'Babinski Sign', link: 'https://www.youtube.com/watch?v=VwpLUUq2L8U')
VideoLink.create(exam_techniques: [plantar_toe_chaddock], title: 'Chaddock Sign', link: 'https://www.youtube.com/watch?v=wdoVBmG9Iz4')
VideoLink.create(exam_techniques: [plantar_toe_achilles_reflex], title: 'Schaeffer Sign', link: 'https://www.youtube.com/watch?v=3nA4dchW0m4')
VideoLink.create(exam_techniques: [plantar_toe_shin_toe_reflex], title: 'Oppenheim Sign', link: 'https://www.youtube.com/watch?v=5CpQq2hfzkU')
VideoLink.create(exam_techniques: [plantar_toe_calf_toe_reflex], title: 'Gordon Sign', link: 'https://www.youtube.com/watch?v=IehrTYg0Mnw')
VideoLink.create(exam_techniques: [plantar_toe_pinprick_toe_reflex], title: 'Gonda or Stransky Sign', link: 'https://www.youtube.com/watch?v=vktHpdMy54M')
VideoLink.create(exam_techniques: [near_visual_activity], title: 'Visual Acuity Test Cranial Nerve II', link: 'https://www.youtube.com/watch?v=wl1hWJAnaYc')
VideoLink.create(exam_techniques: [confrontation_test], title: 'Peripheral or Confrontation Test', link: 'https://www.youtube.com/watch?v=kqPVVsVN4b8')
VideoLink.create(exam_techniques: [pupillary_light_reflex], title: 'Pupillary Light Reflex', link: 'https://www.youtube.com/watch?v=E0BAqYKiYlw')
VideoLink.create(exam_techniques: [accommodation], title: 'Near Reflex', link: 'https://www.youtube.com/watch?v=cV8ZDaRi3VA')
VideoLink.create(exam_techniques: [swinging_flashlight_test], title: 'Swinging Flashlight Test', link: 'https://www.youtube.com/watch?v=tkzXpmZityU')
VideoLink.create(exam_techniques: [extraocular_muscle_movement_test], title: 'Extraocular Muscle Testing', link: 'https://www.youtube.com/watch?v=WWig0j8oNFY')
VideoLink.create(exam_techniques: [corneal_light_reflex_test], title: 'Corneal Light Reflex Test', link: 'https://www.youtube.com/watch?v=pBJcvahjn1E')
VideoLink.create(exam_techniques: [cover_uncover_test], title: 'Cover Uncover Test', link: 'https://www.youtube.com/watch?v=BAnPhkd_E2Y')
VideoLink.create(exam_techniques: [ophthalmoscopic_exam], title: 'Ophtalmic Exam Co axial', link: 'https://www.youtube.com/watch?v=95kz2PbF6zE')

puts 'Done'

# Image Links
print 'Seeding Image Links...'

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

puts 'Done'