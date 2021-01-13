

Queries - Batch 1 - queries requiring a single table
#============================================

#1
# Selecting "Semi-Auto Pistol" and indicdating which player is associated with it 

#select *
#from Character_Weapons
#Where Weapon_Type_A = 'Semi-Auto Pistol'

#2
#Indicating which "Skill_Upgrades" cost more than 20 "Skill_Cost" 

#select *
#from Skill_Upgrades
#Where Skill_Cost > 20

#3
#Indicating which "Skill_Upgrades" are equal to exactly 40 "Skill_Cost" 

#select *
#from Skill_Upgrades 
#Where Skill_Cost = 40

#4
#Indicating all "Stealth" types

#select *
#from Skill_Upgrades
#Where Skill_Type = 'Stealth'

#5
#Indicating all "Explosive" types

#select *
#from Skill_Upgrades
#Where Skill_Type = 'Explosives'

#6
#Indicating all "Survival" types

#select *
#from Skill_Upgrades
#Where Skill_Type = 'Survival'

#7
#Checking who the 'Playable_Character" Abby is

#select *
#from Playable_Characters
#Where Name = 'Abby'

#============================================



Queries - Batch 2 - queries requiring a more than one table
#============================================


#1
#Outputting all "Skill Types" that are associated with "Faster Crafting" and all item numbers associated with Arrows 

#select Skill_Type, Skill_Name, Item_Outcome, Item_1, Item_2
#from Skill_Upgrades, Crafting_Items
#Where Skill_Name = 'Faster Crafting' and Item_Outcome = 'Arrows'

#2
#Outputting the enemy type "Runners" and their bio; Outputting playable character 'Ellie" and her bio and name.

#select Enemy_Type, Infected_Types.Bio, Name, Playable_Characters.Bio
#from Infected_Types, Playable_Characters
#Where Enemy_Type = 'Runners' and Name = 'Ellie'

#3
#Outputting the enemy type "The Rat King" and their bio; Outputting playable character "Abby" and her bio and name.

#select Enemy_Type, Infected_Types.Bio, Name, Playable_Characters.Bio
#from Infected_Types, Playable_Characters
#Where Enemy_Type = 'The_Rat_King' and Name = 'Abby'

#4
#Outputting the enemny type "Clickers" and their bio. Outputing the skill type "Precision" and it's cost

#select Enemy_Type, Infected_Types.Bio, Skill_Type, Skill_Cost
#from Infected_Types, Skill_Upgrades 
#Where Enemy_Type = 'Clickers' and Skill_Type = 'Precision'

#5
#Outputting "Weapon_Type_A" from character weapons and type being "Semi-Auto Pistol"; Outputting enemny type "Bloaters" and their bio.

#select Weapon_Type_A, Enemy_Type, Infected_Types.Bio
#from Character_Weapons, Infected_Types
#Where Weapon_Type_A = 'Semi-Auto Pistol' and Enemy_Type = 'Bloaters'

#6
#Outputting "Weapon_Type_C" from character weapons and type being "Revolver"; Outputting all "Skill Types" that are associated with "Craft Silencers" and their effect.

#select Weapon_Type_C, Skill_Type, Skill_Name, Effect
#from Character_Weapons, Skill_Upgrades
#Where Weapon_Type_C = 'Revolver' and  Skill_Name = 'Craft Silencers'

#============================================



Queries - Batch 3 - basic aggregates (without conditions)
#============================================

#1
#Outputting sum of total item's skill cost

#select SUM(Skill_Cost) 
#from Skill_Upgrades 

#2
#Outputting average of total item's skill cost

#select AVG(Skill_Cost) 
#from Skill_Upgrades 

#3
#Outputting total number of rows in skill cost group

#select COUNT(Skill_Cost) 
#from Skill_Upgrades 

#4
#Outputting the highest value skill cost 

#select MAX(Skill_Cost) 
#from Skill_Upgrades 

#5
#Outputting the lowest value skill cost 

#select MIN(Skill_Cost) 
#from Skill_Upgrades 

#6
#Outputting both the sum and average of skill cost; Outputting average to show the nearest whole number

#select COUNT_BIG(Skill_Cost) 
#from Skill_Upgrades 

#============================================



Queries - Batch 4 - aggregates (with conditions)
#============================================

#1
#Taking the sum of skill cost greater than 40 

select sum(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost > 40;

#2
#Taking the sum of skill cost less than 40 

select sum(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost < 40;

#3
#Taking the rounded average of skill cost greater than 40 

select round(avg(Skill_Cost),0) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost > 40;

#4
#Taking the max number inbetween the minimum number and 55

select max(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost between (select min(Skill_Cost) from Skill_Upgrades) and 55;

#5
#Counting how many skill cost is equal to 60

select count(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost = 60;

#6
#Counting how many skill cost does not equal to 60

select count(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost != 60;

#============================================




Queries - Batch 5 - Advanced Queries
#============================================


#1
#Taking the max number of Skill_Cost inbetween the minimum number and 55

select max(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost between (select min(Skill_Cost) from Skill_Upgrades) and 55;

#2
#Taking the minimum number of Skill_Cost inbetween 27 and the max number

select min(Skill_Cost) High_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost between 27 and (select max(Skill_Cost) from Skill_Upgrades);

#3
#Displaying the skills which their cost equals the max (which is 60)

select Skill_Name, Skill_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost = (select max(Skill_Cost) from Skill_Upgrades);

#4
#Displays skill name and skill cost that have less than the max cost 

select Skill_Name, Skill_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost < (select max(Skill_Cost) from Skill_Upgrades);

#5
#Displays skill name and skill cost that have more than the average cost 

select Skill_Name, Skill_Cost
from Playable_Characters inner join Skill_Upgrades on Playable_Characters.Character_ID = Skill_Upgrades.Characters_FK
where Skill_Cost > (select round(avg(Skill_Cost),0) from Skill_Upgrades);

#6
#Displays the Chapter_Number that has the Number_of_Acts_Appeared_In when that value is greater than the avg of all the Number_of_Acts_Appeared_In together

select Chapter_Number, Number_of_Acts_Appeared_In
from Chapters
where Number_of_Acts_Appeared_In > (select round(avg(Number_of_Acts_Appeared_In),0) from Chapters);