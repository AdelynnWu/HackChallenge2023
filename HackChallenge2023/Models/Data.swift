//
//  Data.swift
//  HackChallenge2023
//
//  Created by Hsia Lu wu on 11/16/23.
//

import Foundation

let dummyData = [
    Club(id: "asdfasdf2q3q5",
          club_name: "Cornell AppDev",
          descriptions: "Recruiting for all positions no first semester freshmen",
          app_link: "http//somethingsomething",
          club_link: "http//appdevcornell",
          category_id: "Project Team",
          deadline: "10/11/2024",
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiEEtS9X2_cMkLSN6Dq92CzA4WpnmFmRTiBPSy4TYxNUi1q8Dd-oYIqrBBnAUt7xlK9kA&usqp=CAU"
          ),
    Club(id: "asdfasdf2q3q5",
          club_name: "Mutual Investment Club",
          descriptions: "Recruiting for junior analysts",
          app_link: "http//somethingsomethinggoogleform",
          club_link: "http//mutualinvestmentcornell",
          category_id: "Business",
          deadline: "10/12/2024",
          imageUrl: "https://media.licdn.com/dms/image/C560BAQF6BdkkywgBhQ/company-logo_200_200/0/1631391332655?e=2147483647&v=beta&t=tqHePxQsTKsPVgSW7OtZV3oaMSt586YT4QyEVjp32zU"
          ),
    Club(id: "asdfasdf2q3q5",
          club_name: "AquaClara",
          descriptions: "Research and Fabrication Subteams: Electronic Hydrodoser, PVC Loads and Forces (PLaF), Filtration Model, Sensor Development",
          app_link: "http//somethingsomething",
          club_link: "http://aguaclara.cornell.edu",
          category_id: "Project Team",
          deadline: "11/17/2024",
          imageUrl: "https://res.cloudinary.com/scalefunder/image/fetch/s--7ZiRgq59--/f_auto,fl_lossy,q_auto/https://github.com/AguaClara/public_relations/blob/master/AguaClara%2520Official%2520Logo/FINAL%2520LOGO%25202.0.png%3Fraw%3Dtrue"
          ),
    Club(id: "asdfasdf2q3q5",
          club_name: "Combat Robotics @ Cornell",
          descriptions: "Algorithm Design, Autonomous Navigation, Budget Management, Computer Programming, Computer-Aided Design (CAD), Corporate Relations",
          app_link: "http//somethingsomethinggoogleform",
          club_link: "http//curobotics",
          category_id: "Project Team",
          deadline: "10/30/2024",
          imageUrl: "https://combatrobotics.engineering.cornell.edu/images/logo.png"
          ),
    Club(id: "asdfasdf2q3q5",
          club_name: "Guild of Visual Arts",
          descriptions: "Recruiting arts enthusiasts!",
          app_link: "http//somethingsomething",
          club_link: "http//gvacornell",
          category_id: "Arts",
          deadline: "10/22/2024",
          imageUrl: "https://ugc.production.linktr.ee/pjRzetioSJiCJKju2qMm_RlCL2tUZlUwDmw5X"
          ),
    Club(id: "asdfasdf2q3q5",
          club_name: "180 Degrees Consulting",
          descriptions: "Recruiting for junior analysts and project managers",
          app_link: "http//somethingsomethinggoogleform",
          club_link: "http//180degreesconsultingcornell",
          category_id: "Business",
          deadline: "10/16/2024",
          imageUrl: "data:image/png;base64,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"
          )
]


