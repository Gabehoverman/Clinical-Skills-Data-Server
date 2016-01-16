# This file should contain all the record creation needed to seed the database with its default values.
# The api can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Links
# = Link.create(title: '', link: '', visible: true)

ent_exam = Link.create(title: 'ENT - Physical Exam of the Ear Nose Throat', link: 'https://www.youtube.com/watch?v=HMOugR37_do', visible: true)
tonsils_exam = Link.create(title: 'Examination Of Tonsils', link: 'https://www.youtube.com/watch?v=dM4jPUIMDT0', visible: true)

# Systems
# = System.create(name: '', details: '', visible: true)

ent = System.create(name: 'Ear, Nose, and Throat', details: 'Anything relating to the Ear, Nose, and Throat', visible: true)
ent.links << [Link.create(title: 'Ears, Nose, & Throat', link: 'https://www.youtube.com/watch?v=djdua3n5Y80', visible: true),
			ent_exam]

cardio = System.create(name: 'Cardiovascular', details: 'This system includes anything relating to the hearts, veins, or arteries', visible: true)
cardio.links << [Link.create(title: 'Cardiovascular System Anatomy', link: 'https://www.youtube.com/watch?v=Sc3IN99sRrI', visible: true),
                 Link.create(title: 'Google', link: 'http://www.google.com', visible: true)]

musc = System.create(name: 'Musculoskeletal', details: 'This system includes anything relating to the muscles or the skeleton', visible: false)
musc.links << Link.create(title: 'The Musculoskeletal System', link: 'https://www.youtube.com/watch?v=g6sLwgUHwTk', visible: true)

resp = System.create(name: 'Respiratory', details: 'This system includes anything relating to the lungs and respiration', visible: false)
resp.links << Link.create(title: 'The Respiratory System', link: 'https://www.youtube.com/watch?v=hc1YtXc_84A', visible: true)

abdomen = System.create(name: 'Abdomen', details: 'This system includes anything relating to the abdominal region', visible: false)
abdomen.links << Link.create(title: 'Abdomen Exam', link: 'https://www.youtube.com/watch?v=AirqmUB-T1Y', visible: true)

# Subsystems
# = System.create(name: '', details: '', visible: true, parent: )

ear = System.create(name: 'Ear', details: 'This system includes anything relating to the ears', visible: true, parent: ent)
ear.links << Link.create(title: 'Examination of the Ear', link: 'https://www.youtube.com/watch?v=ZU0Aix2qYGE', visible: true)

nose = System.create(name: 'Nose', details: 'This system includes anything relating to the nose', visible: true, parent: ent)
nose.links << Link.create(title: 'Nose Examination Role Play', link: 'https://www.youtube.com/watch?v=j7FQuiMQUBU', visible: true)

throat = System.create(name: 'Throat', details: 'This system includes anything relating to the throat', visible: true, parent: ent)
throat.links << ent_exam

left_tonsil = System.create(name: 'Left Tonsil', details: 'Mass of lymphoid tissue in the back of the throat on the left side', visible: true, parent: throat)
left_tonsil.links << tonsils_exam

right_tonsil = System.create(name: 'Right Tonsil', details: 'Mass of lymphoid tissue in the back of the throat on the right side', visible: true, parent: throat)
right_tonsil.links << tonsils_exam