# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Links
# = Link.create(title: '', link: '', visible: true)

# Systems
# = System.create(name: '', description: '', visible: true)

ent = System.create(name: 'Ear, Nose, and Throat', description: 'Anything relating to the Ear, Nose, and Throat', visible: true)
ent.links << [Link.create(title: 'Ears, Nose, & Throat', link: 'https://www.youtube.com/watch?v=djdua3n5Y80', visible: true),
              Link.create(title: 'ENT - Physical Exam of the Ear Nose Throat', link: 'https://www.youtube.com/watch?v=HMOugR37_do', visible: true)
]

cardio = System.create(name: 'Cardiovascular', description: 'This system includes anything relating to the hearts, veins, or arteries', visible: true)
cardio.links << [Link.create(title: 'Cardiovascular System Anatomy', link: 'https://www.youtube.com/watch?v=Sc3IN99sRrI', visible: true)]

musc = System.create(name: 'Musculoskeletal', description: 'This system includes anything relating to the muscles or the skeleton', visible: false)
musc.links << Link.create(title: 'The Musculoskeletal System', link: 'https://www.youtube.com/watch?v=g6sLwgUHwTk', visible: true)

resp = System.create(name: 'Respiratory', description: 'This system includes anything relating to the lungs and respiration', visible: false)
resp.links << Link.create(title: 'The Respiratory System', link: 'https://www.youtube.com/watch?v=hc1YtXc_84A', visible: true)

abdomen = System.create(name: 'Abdomen', description: 'This system includes anything relating to the abdominal region', visible: false)
abdomen.links << Link.create(title: 'Abdomen Exam', link: 'https://www.youtube.com/watch?v=AirqmUB-T1Y', visible: true)

# Subsystems
# = System.create(name: '', description: '', visible: true, parent_system: )

ear = System.create(name: 'Ear', description: 'This system includes anything relating to the ears', visible: true, parent_system: ent)
ear.links << Link.create(title: 'Examination of the Ear', link: 'https://www.youtube.com/watch?v=ZU0Aix2qYGE', visible: true)

nose = System.create(name: 'Nose', description: 'This system includes anything relating to the nose', visible: true, parent_system: ent)
nose.links << Link.create(title: 'Nose Examination Role Play', link: 'https://www.youtube.com/watch?v=j7FQuiMQUBU', visible: true)

throat = System.create(name: 'Throat', description: 'This system includes anything relating to the throat', visible: true, parent_system: ent)
throat.links << Link.create(title: 'ENT - Physical Exam of the Ear Nose Throat', link: 'https://www.youtube.com/watch?v=HMOugR37_do', visible: true)

left_tonsil = System.create(name: 'Left Tonsil', description: 'Mass of lymphoid tissue in the back of the throat on the left side', visible: true, parent_system: throat)
left_tonsil.links << Link.create(title: 'Examination Of Tonsils', link: 'https://www.youtube.com/watch?v=dM4jPUIMDT0', visible: true)

right_tonsil = System.create(name: 'Right Tonsil', description: 'Mass of lymphoid tissue in the back of the throat on the right side', visible: true, parent_system: throat)
right_tonsil.links << Link.create(title: 'Examination Of Tonsils', link: 'https://www.youtube.com/watch?v=dM4jPUIMDT0', visible: true)