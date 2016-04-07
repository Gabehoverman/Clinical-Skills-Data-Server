# This file should contain all the record creation needed to seed the database with its default values.
# The api can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# System

musculoskeletal = System.create(name: 'Musculoskeletal', details: 'System of Muscles')
eye = System.create(name: 'Eye', details: 'Eye')

# Component

cervical_spine = Component.create(system:  musculoskeletal, name: 'Cervical Spine', inspection: 'Begin inspection as the patient enters the examining room. Does the patient’s head move naturally with their body movements? If they hold their head stiffly to one side it could be to protect an area of pain. The neck region should then be inspected for any abnormalities such as blisters, scars and discoloration.', notes: '')
lumbar_spine = Component.create(system:  musculoskeletal, name: 'Lumbar Spine', inspection: 'Anterior, posterior, lateral aspects of patient’s posture, ability to stand erect, symmetry, lordosis, discoloration, swelling, masses, muscular hypertrophy, atrophy, or spasms.', notes: '')

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

# Range of Motion

RangeOfMotion.create(component: cervical_spine, motion: 'Flexion', degrees: '50', notes: 'Touch chin to chest')
RangeOfMotion.create(component: cervical_spine, motion: 'Extension', degrees: '60', notes: 'Look at ceiling directly above')
RangeOfMotion.create(component: cervical_spine, motion: 'Side Bending', degrees: '45', notes: 'Touch ear to shoulder without moving shoulder')
RangeOfMotion.create(component: cervical_spine, motion: 'Rotation', degrees: '80', notes: 'Chin nearly inline with shoulder')

RangeOfMotion.create(component: lumbar_spine, motion: 'Flexion', degrees: '75-90', notes:'')
RangeOfMotion.create(component: lumbar_spine, motion: 'Extension', degrees: '30', notes:'')
RangeOfMotion.create(component: lumbar_spine, motion: 'Lateral Bending', degrees: '35', notes:'')
RangeOfMotion.create(component: lumbar_spine, motion: 'Rotation', degrees: '30', notes:'')

# Muscle

Muscle.create(name: 'Sternocleidomastoid', component: cervical_spine)
Muscle.create(name: 'Trapezius', component: cervical_spine)
Muscle.create(name: 'Flexors', component: cervical_spine)
Muscle.create(name: 'Extensors', component: cervical_spine)

# Special Test

spurling_test = SpecialTest.create(component: cervical_spine, name: 'Spurling\'s Test', positive_sign: 'Radiating pain', indication: 'Nerve root impingement')
compression_distraction = SpecialTest.create(component: cervical_spine, name: 'Compression and Distraction Tests', positive_sign: 'Reproduction of pain and relief of pain', indication: 'Issue with the cervical spine that warrants further investigation')

straight_leg_raising = SpecialTest.create(component: lumbar_spine, name: 'Straight Leg Raising Test', positive_sign: 'Radiating pain below the knee', indication: 'Nerve root irritation or lumbar disc herniation', notes:'Have the patient lie supine with the neck slightly flexed. Lift the leg upward by supporting the foot around the calcaneus. The knee should remain straight as you do this. No pain should be felt below the knee with leg raising. Many people may experience pain during this, but is it sciatic nerve pain or hamstring tightness? Sciatic nerve pain will extend down the whole leg, whereas hamstring tightness will involve only the posterior thigh. Flexion of the knee often eliminates the pain with leg raising (due to hamstring tightness). Repeat the procedure on the unaffected leg. Crossover pain in the affected leg with this maneuver is more supportive of the finding of tension on the nerve roots.')
femoral_stretch_test = SpecialTest.create(component: lumbar_spine, name: 'Femoral Stretch Test', positive_sign: 'Pain', indication: 'Nerve root compression at L1-L3')

# Exam Technique

far_visual_activity = ExamTechnique.create(system: eye, name: 'Far Visual Activity', details: 'Snellen Chart')
near_visual_activity = ExamTechnique.create(system: eye, name: 'Near Visual Activity', details: 'Rosenbaum Chart')

# Video Link

VideoLink.create(exam_techniques: [near_visual_activity], title: 'Visual Acuity Test Cranial Nerve II', link: 'https://www.youtube.com/watch?v=wl1hWJAnaYc')
VideoLink.create(exam_techniques: [near_visual_activity], title: 'Visual Acuity Test Cranial Nerve III', link: 'https://www.google.com')
VideoLink.create(exam_techniques: [near_visual_activity], title: 'Visual Acuity Test Cranial Nerve IV', link: 'https://www.reddit.com')

VideoLink.create(special_tests: [spurling_test], title: 'Spurling Test', link: 'https://www.youtube.com/watch?v=VYENa1Dre10')
VideoLink.create(special_tests: [compression_distraction], title: 'Compression and Distraction Test', link: 'https://www.youtube.com/watch?v=TnoJySUENAk')

VideoLink.create(special_tests: [straight_leg_raising], title: 'Straight Leg Raising Test', link: 'https://www.youtube.com/watch?v=aL85pm7J6Io')
VideoLink.create(special_tests: [femoral_stretch_test], title: 'Femoral Stretch Test', link: 'https://www.youtube.com/watch?v=baMKfLssJ3Y')

# Image Link
ImageLink.create(special_tests: [spurling_test], title: 'Spurling\'s Test', link: Cloudinary::Api.resource('musculoskeletal/spurling_test')['secure_url'])
ImageLink.create(special_tests: [compression_distraction], title: 'Compression Test', link: Cloudinary::Api.resource('musculoskeletal/compression_test')['secure_url'])
ImageLink.create(special_tests: [compression_distraction], title: 'Distraction Test', link: Cloudinary::Api.resource('musculoskeletal/distraction_test')['secure_url'])