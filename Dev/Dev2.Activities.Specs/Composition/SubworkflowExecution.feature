﻿@SubworkflowExecution
Feature: SubworkflowExecution
	In order to execute a subworkflow
	As a Warewolf user
	I want to be able to build workflows that contain other workflows from a running server instance
	 
Background: Setup for subworkflow execution
			Given Debug events are reset
			And All environments disconnected
			And Debug states are cleared

Scenario: Workflow with an assign and remote workflow
	Given I have a workflow "TestAssignWithRemoteWF"
	 And "TestAssignWithRemoteWF" contains an Assign "AssignData" as
	  | variable      | value |
	  | [[inputData]] | hello |
	And "TestAssignWithRemoteWF" contains "WorkflowUsedBySpecs" from server "Remote Connection Integration" with mapping as
	| Input to Service | From Variable | Output from Service | To Variable      |
	| inputData        | [[inputData]] | output              | [[output]]       |
	|                  |               | values(*).up        | [[values().up]]  |
	|                  |               | values(*).low       | [[values().low]] |
	  When "TestAssignWithRemoteWF" is executed
	  Then the workflow execution has "NO" error
	   And the "AssignData" in WorkFlow "TestAssignWithRemoteWF" debug inputs as
	  | # | Variable        | New Value |
	  | 1 | [[inputData]] = | hello     |
	  And the "AssignData" in Workflow "TestAssignWithRemoteWF" debug outputs as    
	  | # |                       |
	  | 1 | [[inputData]] = hello |
	   And the "WorkflowUsedBySpecs" in WorkFlow "TestAssignWithRemoteWF" debug inputs as
	  |                       |
	  | [[inputData]] = hello |
	  And the "Setup Assign (1)" in Workflow "WorkflowUsedBySpecs" debug outputs as
	  | # |                |
	  | 1 | [[in]] = hello |
	  And the "Convert Case (1)" in Workflow "WorkflowUsedBySpecs" debug outputs as
	  | # |                |
	  | 1 | [[in]] = HELLO |
	  And the "Final Assign (3)" in Workflow "WorkflowUsedBySpecs" debug outputs as
	  | # |                             |
	  | 1 | [[output]] = HELLO          |
	  | 2 | [[values(1).up]] = HELLO |
	  | 3 | [[values(1).low]] = hello |	  	 
	  And the "WorkflowUsedBySpecs" in Workflow "TestAssignWithRemoteWF" debug outputs as
	  |                           |
	  | [[values(1).up]] = HELLO  |
	  | [[values(1).low]] = hello |
	  | [[output]] = HELLO        |      
      
Scenario: Example Executing Utility - Format Number example workflow
	  Given I have a workflow "Utility - Format Number Test"
	  And "Utility - Format Number Test" contains "Utility - Format Number" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Utility - Format Number Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Format Number1" in WorkFlow "Utility - Format Number" debug inputs as
	  | Number  | Rounding | Rounding Value | Decimals to show |
	  | 123.446 | Normal   | 2              | 2                |
	  And the "Format Number1" in Workflow "Utility - Format Number" debug outputs as    
	  |                    |
	  | [[Price]] = 123.45 |
	   And the "Format Number2" in WorkFlow "Utility - Format Number" debug inputs as
	  | Number | Rounding | Rounding Value | Decimals to show |
	  | 14649  | Up       | -2             | -3               |
	  And the "Format Number2" in Workflow "Utility - Format Number" debug outputs as    
	  |                   |
	  | [[PriceInK]] = 14 |

 
Scenario: Example Executing Utility - Random example workflow
	  Given I have a workflow "Utility - Random Test"
	  And "Utility - Random Test" contains "Utility - Random" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Utility - Random Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Random1" in WorkFlow "Utility - Random" debug inputs as
	  | Random  | From | To |
	  | Numbers | 1    | 6  |
	  And the "Random1" in Workflow "Utility - Random" debug outputs as    
	  |                      |
	  | [[DiceRoll]] = Int32 |
	    And the "Random2" in WorkFlow "Utility - Random" debug inputs as
	  | Random  | Length |
	  | Letters | 7      |
	  And the "Random2" in Workflow "Utility - Random" debug outputs as    
	  |                       |
	  | [[Scrabble]] = String |
	     And the "Random3" in WorkFlow "Utility - Random" debug inputs as
	  | Random |
	  | GUID   | 
	  And the "Random3" in Workflow "Utility - Random" debug outputs as    
	  |                      |
	  | [[License]] = String |


Scenario: Example Executing Utility - Date and Time example workflow
	  Given I have a workflow "Utility - Date and Time Test"
	  And "Utility - Date and Time Test" contains "Utility - Date and Time" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Utility - Date and Time Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Date and Time(1)" in WorkFlow "Utility - Date and Time" debug inputs as
	  | Input            | =        | Input Format            | =                      | Add Time |  | Output Format           | =                      |
	  | System Date Time | DateTime | System Date Time Format | yyyy/MM/dd hh:mm:ss tt | ""       |  | System Date Time Format | yyyy/MM/dd hh:mm:ss tt |
	  And the "Date and Time(1)" in Workflow "Utility - Date and Time" debug outputs as    
	  |                       |
	  | [[nowish]] = DateTime |   
	 And the "Date and Time(2)" in WorkFlow "Utility - Date and Time" debug inputs as
	 | Input                 | Input Format            | =                      | Add Time |  | Output Format          |
	 | [[nowish]] = DateTime | System Date Time Format | yyyy/MM/dd hh:mm:ss tt | ""       |  | mm/dd/yy 12h:min am/pm |
	  And the "Date and Time(2)" in Workflow "Utility - Date and Time" debug outputs as    
	  |                       |
	  | [[nowishNewFormat]] = DateTime |  
	  And the "Date and Time(3)" in WorkFlow "Utility - Date and Time" debug inputs as
	  | Input              | Input Format | Add Time |       | Output Format            |
	  | Sunday, 23 July 78 | DW, dd MM yy | Minutes  | 46664 | mm/dd/yyyy 12h:min am/pm |	
	  And the "Date and Time(3)" in Workflow "Utility - Date and Time" debug outputs as    
	  |                             |
	  | [[SomeTimeBack]] = DateTime |  
	 And the "Date and Time(4)" in WorkFlow "Utility - Date and Time" debug inputs as
	  | Input | Input Format | Add Time |  | Output Format                  |
	  | am    | am/pm        | ""       |  | mm/dd/yyyy 12h:min:ss.sp am/pm |
	  And the "Date and Time(4)" in Workflow "Utility - Date and Time" debug outputs as    
	  |                               |
	  | [[TheDefaultDate]] = DateTime |  
	  And the "Date and Time(5)" in WorkFlow "Utility - Date and Time" debug inputs as
	  | Input            | =        | Input Format            | =                      | Add Time |  | Output Format                                 |
	  | System Date Time | DateTime | System Date Time Format | yyyy/MM/dd hh:mm:ss tt | ""       |  | "'Date format yyyy MM dd yields : ' yyyy MM dd |

Scenario: Example Executing Utility - Gather System Information example workflow
	  Given I have a workflow "Utility - System Information Test"
	  And "Utility - System Information Test" contains "Utility - System Information" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Utility - System Information Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Gather System Information (17)" in WorkFlow "Utility - System Information" debug inputs as
	 | #  |                     |                     |
	 | 1  | [[DateTime]] =      | Date & Time         |
	 | 2  | [[OpSystem]]  =     | Operating System    |
	 | 3  | [[SP]] =            | Service Pack        |
	 | 4  | [[Bit]] =           | 32/64 Bit           |
	 | 5  | [[DateTimeFormat]] = | Date & Time Format  |
	 | 6  | [[DiskAvailable]] = | Disk Available (GB) |
	 | 7  | [[DiskTotal]]  =    | Disk Total (GB)     |
	 | 8  | [[RAMAvailable]] =  | RAM Available (MB)  |
	 | 9  | [[RAMTotal]]  =     | RAM Total (MB)      |
	 | 10 | [[CPUAvailable]] =  | CPU Available       |
	 | 11 | [[CPUTotal]]  =     | CPU Total           |
	 | 12 | [[Language]] =      | Language            |
	 | 13 | [[Region]] =        | Region              |
	 | 14 | [[UserRoles]] =     | User Roles          |
	 | 15 | [[UserName]] =      | User Name           |
	 | 16 | [[Domain]] =        | Domain              |
	 | 17 | [[Agents]] =        | Warewolf Agents     |
	 And the "Gather System Information (17)" in Workflow "Utility - System Information" debug outputs as    
	   | #  |                               |
	   | 1  | [[DateTime]]      =    String |
	   | 2  | [[OpSystem]]      =    String |
	   | 3  | [[SP]]            =    String |
	   | 4  | [[Bit]]           =    String |
	   | 5  | [[DateTimeFormat]] =    String |
	   | 6  | [[DiskAvailable]] =    String |
	   | 7  | [[DiskTotal]]     =    String |
	   | 8  | [[RAMAvailable]]  =    String |
	   | 9  | [[RAMTotal]]      =    String |
	   | 10 | [[CPUAvailable]]  =    String |
	   | 11 | [[CPUTotal]]      =    String |
	   | 12 | [[Language]]      =    String |
	   | 13 | [[Region]]        =    String |
	   | 14 | [[UserRoles]]     =    String |
	   | 15 | [[UserName]]      =    String |
	   | 16 | [[Domain]]        =    String |
	   | 17 | [[Agents]]        =    String |


Scenario: Example Executing Utility - Web Request example workflow
	  Given I have a workflow "Utility - Web Request Test"
	  And "Utility - Web Request Test" contains "Utility - Web Request" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Utility - Web Request Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Web Request(1)" in WorkFlow "Utility - Web Request" debug inputs as
	  | URL                     | Header |
	  | https://www.google.com/ |        |
	  And the "Web Request(1)" in Workflow "Utility - Web Request" debug outputs as    
	  |                         |
	  | [[GoogleHome]] = String |
	  And the "Web Request(2)" in WorkFlow "Utility - Web Request" debug inputs as
	  | URL                                                                                            | Header |
	  | http://maps.googleapis.com/maps/api/geocode/xml?address=[[BartsAddress]]&sensor=false = String |        |
	  And the "Web Request(2)" in Workflow "Utility - Web Request" debug outputs as    
	  |                             |
	  | [[GecodedAddress]] = String |

Scenario: Example Executing Utility - Assign example workflows
	  Given I have a workflow "Test Example Utility - Assign"
	  And "Test Example Utility - Assign" contains "Utility - Assign" from server "localhost" with mapping as
	 | Input to Service | From Variable | Output from Service | To Variable        |
	 |                  |               | rec(*).set      | [[rec().set]]      |
	 |                  |               | hero(*).pushups | [[hero().pushups]] |
	 |                  |               | hero(*).name    | [[hero().name]]    |
	  When "Test Example Utility - Assign" is executed
	  Then the workflow execution has "NO" error
	  And the "Utility - Assign" in Workflow "Test Example Utility - Assign" debug outputs as    
	  |                                                                |
	  | [[rec(1).set]] = Bart Simpson: I WILL NOT INSTIGATE REVOLUTION |
	  | [[hero(1).pushups]] = All of them.                             |
	  | [[hero(1).name]] = Chuck Norris                                |

	

Scenario: Example Executing Data - Base Conversion example workflow
	  Given I have a workflow "Data - Base Conversion Test"
	  And "Data - Base Conversion Test" contains "Data - Base Conversion" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Data - Base Conversion Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Base Conversion (1)" in WorkFlow "Data - Base Conversion" debug inputs as
	  | # | Convert                                                                                                             | From   | To   |
	  | 1 | [[Blob]] = 01001001001000000111011101100001011100110010000001101101011000010110111001100111011011000110010101100100 | Binary | Text |
	  And the "Base Conversion (1)" in Workflow "Data - Base Conversion" debug outputs as    
	   | # |                          |
	   | 1 | [[Blob]] = I was mangled |


Scenario: Example Executing Data - Case Conversion example workflow
	  Given I have a workflow "Data - Case Conversion Test"
	  And "Data - Case Conversion Test" contains "Data - Case Conversion" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Data - Case Conversion Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Case Conversion1 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                                            | To    |
	  | 1 | [[sometext]] = gET reaDy FoR sOme Text CONVersionS | UPPER | 
	  And the "Case Conversion1 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                                                    |
	   | 1 | [[sometext]] = GET READY FOR SOME TEXT CONVERSIONS |
	   And the "Case Conversion2 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                                            | To    |
	  | 1 | [[sometext]] = GET READY FOR SOME TEXT CONVERSIONS | lower | 
	  And the "Case Conversion2 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                                                    |
	   | 1 | [[sometext]] = get ready for some text conversions |
	   And the "Case Conversion3 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                                            | To       |
	  | 1 | [[sometext]] = get ready for some text conversions | Sentence | 
	  And the "Case Conversion3 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                                                    |
	   | 1 | [[sometext]] = Get ready for some text conversions |
	     And the "Case Conversion4 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                                            | To         |
	  | 1 | [[sometext]] = Get ready for some text conversions | Title Case | 
	  And the "Case Conversion4 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                                                    |
	   | 1 | [[sometext]] = Get Ready For Some Text Conversions |
	     And the "Case Conversion5 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                       | To    |
	  | 1 | [[sometext]] = 1Mixed up 5om3 | UPPER | 
	  And the "Case Conversion5 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                               |
	   | 1 | [[sometext]] = 1MIXED UP 5OM3 |
	     And the "Case Conversion6 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                       | To       |
	  | 1 | [[sometext]] = 1MIXED UP 5OM3 | lower | 
	  And the "Case Conversion6 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                                                    |
	   | 1 | [[sometext]] = 1mixed up 5om3 |
	     And the "Case Conversion7 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                       | To       |
	  | 1 | [[sometext]] = 1mixed up 5om3 | Sentence | 
	  And the "Case Conversion7 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                               |
	   | 1 | [[sometext]] = 1mixed up 5om3 |
	     And the "Case Conversion8 (1)" in WorkFlow "Data - Case Conversion" debug inputs as
	  | # | Convert                       | To         |
	  | 1 | [[sometext]] = 1mixed up 5om3 | Title Case | 
	  And the "Case Conversion8 (1)" in Workflow "Data - Case Conversion" debug outputs as    
	   | # |                               |
	  | 1 | [[sometext]] = 1Mixed Up 5Om3 |


Scenario: Example Executing Data - Data Merge example workflow
	  Given I have a workflow "Data - Data Merge Test"
	  And "Data - Data Merge Test" contains "Data - Data Merge" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  |                  |               | FileContent         | [[FileContent]] |
	  When "Data - Data Merge Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Data - Data Merge" in Workflow "Data - Data Merge" debug outputs as    
	    |                                                                |
	    | [[FileContent]] = String |
	   
Scenario: Example Executing Data - Find Index example workflow
	  Given I have a workflow "Utility - Find Index Test"
	  And "Utility - Find Index Test" contains "Utility - Find Index" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Utility - Find Index Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Find Index1" in WorkFlow "Utility - Find Index" debug inputs as
	  | In Field | Index            | Characters | Direction     |
	  | abc      | First Occurrence | b          | Left to Right |
	  And the "Find Index1" in Workflow "Utility - Find Index" debug outputs as  
	  |                  |
	  | [[WhereIsB]] = 2 |
	  And the "Find Index2" in WorkFlow "Utility - Find Index" debug inputs as
	  | In Field           | Index           | Characters | Direction     |
	  | abcbdefghibjklmnop | All Occurrences | b          | Left to Right |
	  And the "Find Index2" in Workflow "Utility - Find Index" debug outputs as  
	  |                            |
	  | [[WhereAreTheBs]] = 2,4,11 |

Scenario: Example Excuting File and Folder - Copy
	  Given I have a workflow "File and Folder - Copy Test"
	  And "File and Folder - Copy Test" contains "File and Folder - Copy" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Copy Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Copy" in Workflow "File and Folder - Copy" debug outputs as 
	  |                  |
	  | [[Complete]] = Success |

Scenario: Example Excuting File and Folder - Create
	  Given I have a workflow "File and Folder - Create Test"
	  And "File and Folder - Create Test" contains "File and Folder - Create" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Create Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Create" in Workflow "File and Folder - Create" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario: Example Excuting File and Folder - Delete
	  Given I have a workflow "File and Folder - Delete Test"
	  And "File and Folder - Delete Test" contains "File and Folder - Delete" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Delete Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Delete" in Workflow "File and Folder - Delete" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario: Example Excuting File and Folder - Move
	  Given I have a workflow "File and Folder - Move Test"
	  And "File and Folder - Move Test" contains "File and Folder - Move" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Move Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Move" in Workflow "File and Folder - Move" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario:Example Excuting File and Folder - Read File
	  Given I have a workflow "File and Folder - Read File Test"
	  And "File and Folder - Read File Test" contains "File and Folder - Read File" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Read File Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Read File" in Workflow "File and Folder - Read File" debug outputs as 
	  |                                         |
	  | [[Logs]] = the contents of the log file |

Scenario: Example Excuting File and Folder - Rename
	  Given I have a workflow "File and Folder - Rename Test"
	  And "File and Folder - Rename Test" contains "File and Folder - Rename" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Rename Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Rename" in Workflow "File and Folder - Rename" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario: Example Excuting File and Folder - Unzip
	  Given I have a workflow "File and Folder - Unzip Test"
	  And "File and Folder - Unzip Test" contains "File and Folder - Unzip" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Unzip Test" is executed
	  Then the workflow execution has "NO" error
	  And the "UnZip" in Workflow "File and Folder - Unzip" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario: Example Excuting File and Folder - Write File
	  Given I have a workflow "File and Folder - Write File Test"
	  And "File and Folder - Write File Test" contains "File and Folder - Write File" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Write File Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Write" in Workflow "File and Folder - Write File" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario: Example Excuting File and Folder - Zip
	  Given I have a workflow "File and Folder - Zip Test"
	  And "File and Folder - Zip Test" contains "File and Folder - Zip" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "File and Folder - Zip Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Zip" in Workflow "File and Folder - Zip" debug outputs as 
	  |                        |
	  | [[Complete]] = Success |

Scenario: Example Executing Utility - Replace example workflow
	  Given I have a workflow "Utility - Replace Test"
	  And "Utility - Replace Test" contains "Utility - Replace" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Utility - Replace Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Replace1" in WorkFlow "Utility - Replace" debug inputs as
	 | In Field(s)            | Find | Replace With |
	 | [[SomeText]] = Replace | ac   | icat         |
	  And the "Replace1" in Workflow "Utility - Replace" debug outputs as  
	  |                                                                               |
	  | [[SomeText]] = Replicate                                                      |
	  | [[count]] = 1                                                                 |
	  And the "Replace2" in Workflow "Utility - Replace" debug outputs as  
	  |                                       |
	  | [[rec(1).homeNumber]]   = +1553122442 |
	  | [[rec(2).homeNumber]]   = +1554682136 |
	  | [[rec(1).mobileNumber]] = +1655985781 |
	  | [[rec(2).mobileNumber]] = +1985623145 |
	  | [[recount]] = 3                       |

Scenario: Example Executing Recordset - Count Records example workflow
	  Given I have a workflow "Recordset - Count Records Test"
	  And "Recordset - Count Records Test" contains "Recordset - Count Records" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Recordset - Count Records Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Count Records" in WorkFlow "Recordset - Count Records" debug inputs as
	  | Recordset                  |
	  | [[rec(1).set]] = Warewolf |
	  | [[rec(2).set]] = SOA |
	  | [[rec(3).set]] = Recordset |
	  And the "Count Records" in Workflow "Recordset - Count Records" debug outputs as  
	  |               |
	  | [[count]] = 3 |

Scenario: Example Executing Recordset - Records Length example workflow
	  Given I have a workflow "Recordset - Records Length Test"
	  And "Recordset - Records Length Test" contains "Recordset - Records Length" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Recordset - Records Length Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Length1" in WorkFlow "Recordset - Records Length" debug inputs as
	  | Recordset                  |
	  | [[rec(1).set]] = Warewolf  |
	  | [[rec(5).set]] = Recordset |
	  And the "Length1" in Workflow "Recordset - Records Length" debug outputs as  
	  |                |
	  | [[length]] = 5 |
	  And the "Length2" in WorkFlow "Recordset - Records Length" debug inputs as
	  | Recordset                  |
	  | [[rec(5).set]] = Recordset |
	  And the "Length2" in Workflow "Recordset - Records Length" debug outputs as  
	  |                |
	  | [[length]] = 5 |

Scenario: Example Executing Recordset - Delete Records example workflow
	  Given I have a workflow "Recordset - Delete Records Test"
	  And "Recordset - Delete Records Test" contains "Recordset - Delete Records" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Recordset - Delete Records Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Delete Record1" in WorkFlow "Recordset - Delete Records" debug inputs as
	  | Records          |
	  | [[rec(2).set]] = 2 |
	  And the "Delete Record1" in Workflow "Recordset - Delete Records" debug outputs as  
	  |                      |
	  | [[result]] = Success |
	  And the "Delete Record2" in WorkFlow "Recordset - Delete Records" debug inputs as
	  | Records          |
	  | [[rec(1).set]] = 1 |
	  | [[rec(3).set]] = 3 |
	  And the "Delete Record2" in Workflow "Recordset - Delete Records" debug outputs as  
	  |                      |
	  | [[result]] = Success |

Scenario: Example Executing Recordset - Find Records example workflow
	  Given I have a workflow "Recordset - Find Records Test"
	  And "Recordset - Find Records Test" contains "Recordset - Find Records" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Recordset - Find Records Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Find Record Index (2)" in Workflow "Recordset - Find Records" debug outputs as  
	  |                   |
	  | [[Results]] = 6,8 |
	  
Scenario:Example Executing Recordset - Sort Records example workflow
	  Given I have a workflow "Recordset - Sort Records Test"
	  And "Recordset - Sort Records Test" contains "Recordset - Sort Records" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Recordset - Sort Records Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Sort Records1" in WorkFlow "Recordset - Sort Records" debug inputs as
	  | Sort Field         | Sort Order |
	  | [[rec(1).set]] = 2 |            |
	  | [[rec(2).set]] = x |            |
	  | [[rec(3).set]] = 3 |            |
	  | [[rec(4).set]] = c |            |
	  | [[rec(5).set]] = y |            |
	  | [[rec(6).set]] = 0 |            |
	  | [[rec(7).set]] = a |            |
	  | [[rec(8).set]] = b |            |
	  | [[rec(9).set]] = 1 |            |
	  | [[rec(10).set]] =z | Forward  |
	  And the "Sort Records1" in Workflow "Recordset - Sort Records" debug outputs as  
	   |                    |
	   | [[rec(1).set]] = 0 |
	   | [[rec(2).set]] = 1 |
	   | [[rec(3).set]] = 2 |
	   | [[rec(4).set]] = 3 |
	   | [[rec(5).set]] = a |
	   | [[rec(6).set]] = b |
	   | [[rec(7).set]] = c |
	   | [[rec(8).set]] = x |
	   | [[rec(9).set]] = y |
	   | [[rec(10).set]] =z |	  
	  And the "Sort Records2" in WorkFlow "Recordset - Sort Records" debug inputs as
	   | Sort Field         | Sort Order |
	   | [[rec(1).set]] = 0 |            |
	   | [[rec(2).set]] = 1 |            |
	   | [[rec(3).set]] = 2 |            |
	   | [[rec(4).set]] = 3 |            |
	   | [[rec(5).set]] = a |            |
	   | [[rec(6).set]] = b |            |
	   | [[rec(7).set]] = c |            |
	   | [[rec(8).set]] = x |            |
	   | [[rec(9).set]] = y |            |
	   | [[rec(10).set]] =z | Backwards    |
	  And the "Sort Records2" in Workflow "Recordset - Sort Records" debug outputs as  
	 |                    |
	 | [[rec(1).set]] = z |
	 | [[rec(2).set]] = y |
	 | [[rec(3).set]] = x |
	 | [[rec(4).set]] = c |
	 | [[rec(5).set]] = b |
	 | [[rec(6).set]] = a |
	 | [[rec(7).set]] = 3 |
	 | [[rec(8).set]] = 2 |
	 | [[rec(9).set]] = 1 |
	 | [[rec(10).set]] = 0 |

Scenario: Example Executing Recordset - Unique Records example workflow
	  Given I have a workflow "Recordset - Unique Records Test"
	  And "Recordset - Unique Records Test" contains "Recordset - Unique Records" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Recordset - Unique Records Test" is executed
	  Then the workflow execution has "NO" error
	  And the "Unique Records1" in WorkFlow "Recordset - Unique Records" debug inputs as
	   | #           |                                  | Return Fields         |
	   | In Field(s) | [[Example(4).FirstName]] = Jerome | [[Example().Index]] = |
	   And the "Unique Records1" in Workflow "Recordset - Unique Records" debug outputs as  
	   | # |                            |
	   | 1 | [[Result(1).example1]] = 1 |
	   |   | [[Result(2).example1]] = 4 |
      And the "Unique Records2" in WorkFlow "Recordset - Unique Records" debug inputs as
	   | #           |                                   | Return Fields         |
	   | In Field(s) | [[Example(4).FirstName]] = Jerome |                       |
	   |             | [[Example(4).LastName]] = Smit    | [[Example().Index]] = |
	   And the "Unique Records2" in Workflow "Recordset - Unique Records" debug outputs as  
	   | # |                            |
	   | 1 | [[Result(1).example2]] = 1 |
	   |   | [[Result(2).example2]] = 2 |
	   |   | [[Result(3).example2]] = 4 |

Scenario: Example Executing Control Flow - Sequence example workflow
	  Given I have a workflow "Control Flow - Sequence Test"
	  And "Control Flow - Sequence Test" contains "Control Flow - Sequence" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Control Flow - Sequence Test" is executed
	  Then the workflow execution has "NO" error
      And the "Split Names (3)" in Workflow "Organize Customers" debug outputs as
	   | # |                                                       |
	   | 1 | [[TempCustomers(1).FirstName]] = bart                 |
	   |   | [[TempCustomers(2).FirstName]] = homer                |
	   |   | [[TempCustomers(3).FirstName]] = marge                |
	   |   | [[TempCustomers(4).FirstName]] = lisa                 |
	   |   | [[TempCustomers(5).FirstName]] = maggie               |
	   | 2 | [[TempCustomers(1).LastName]] = simpson               |
	   |   | [[TempCustomers(2).LastName]] = simpson               |
	   |   | [[TempCustomers(3).LastName]] = simpson               |
	   |   | [[TempCustomers(4).LastName]] = simpson               |
	   |   | [[TempCustomers(5).LastName]] = simpson               |
	   | 3 | [[TempCustomers(1).Email]] = bart.simpson@couch.com   |
	   |   | [[TempCustomers(2).Email]] = homer.simpson@couch.com  |
	   |   | [[TempCustomers(3).Email]] = marge.simpson@couch.com  |
	   |   | [[TempCustomers(4).Email]] = lisa.simpson@couch.com   |
	   |   | [[TempCustomers(5).Email]] = maggie.simpson@couch.com |        
	   And the "Sort Names Alphabetically" in WorkFlow "Organize Customers" debug inputs as
	   | Sort Field                          | Sort Order |
	   | [[Customers(1).FirstName]] = bart   |            |
	   | [[Customers(2).FirstName]] = homer  |            |
	   | [[Customers(3).FirstName]] = marge  |            |
	   | [[Customers(4).FirstName]] = lisa   |            |
	   | [[Customers(5).FirstName]] = maggie | Forward    |
	   And the "Sort Names Alphabetically" in Workflow "Organize Customers" debug outputs as
	   |                                     |
	   | [[Customers(1).FirstName]] = bart   |
	   | [[Customers(2).FirstName]] = homer  |
	   | [[Customers(3).FirstName]] = lisa   |
	   | [[Customers(4).FirstName]] = maggie |
	   | [[Customers(5).FirstName]] = marge  |

Scenario: Example Executing Control Flow - Decision example workflow
	  Given I have a workflow "Control Flow - Decision Test"
	  And "Control Flow - Decision Test" contains "Control Flow - Decision" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Control Flow - Decision Test" is executed
	  Then the workflow execution has "NO" error

Scenario: Example Executing Control Flow - Switch example workflow
	  Given I have a workflow "Control Flow - Switch Test"
	  And "Control Flow - Switch Test" contains "Control Flow - Switch" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable     |
	  When "Control Flow - Switch Test" is executed
	  Then the workflow execution has "NO" error

Scenario: Example Executing Scripting - Script example workflow
  Given I have a workflow "Scripting - Script Test"
  And "Scripting - Script Test" contains "Scripting - Script" from server "localhost" with mapping as
  | Input to Service | From Variable | Output from Service | To Variable     |
  When "Scripting - Script Test" is executed
  Then the workflow execution has "NO" error
  And the "Script1" in WorkFlow "Scripting - Script" debug inputs as	
  | Language | Script   |
  | Ruby     | sleep(5) | 
  And the "Script1" in Workflow "Scripting - Script" debug outputs as    
  |                |
  | [[Result]] = 5 | 
  And the "Script2" in WorkFlow "Scripting - Script" debug inputs as	
  | Language   | Script          |
  | JavaScript | String = String |
  And the "Script2" in Workflow "Scripting - Script" debug outputs as    
  |                |
  | [[Result]] = 7 | 
  And the "Script3" in WorkFlow "Scripting - Script" debug inputs as	
  | Language | Script          |
  | Python   | String = String |
  And the "Script3" in Workflow "Scripting - Script" debug outputs as    
  |                  |
  | [[Result]] = not one or two |
	
Scenario: Executing Workflow Service and Decision tool expected bubling out error in workflow service
	  Given I have a workflow "Utility - Assign WF"
	  And "Utility - Assign WF" contains "Utility - Assign" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable        |
	  |                  |               | rec(*).set      | [[myrec().set]]      |
	  |                  |               | hero(*).pushups | [[thehero().pushups]] |
	  |                  |               | hero(*).name    | [[thehero().name]]    |
	  When "Utility - Assign WF" is executed
	  Then the workflow execution has "NO" error
	  And the "Utility - Assign" in Workflow "Utility - Assign WF" debug outputs as    
	  |                                                                   |
	  | [[myrec(1).set]] =    Bart Simpson: I WILL NOT INSTIGATE REVOLUTION |
	  | [[thehero(1).pushups]] = All of them.                                |
	  | [[thehero(1).name]] =   Chuck Norris                                 |
	
Scenario: Error from workflow service is expected to buble out
	  Given I have a workflow "TestAssignWithRemoteOutputsErrors"
	  And "TestAssignWithRemoteOutputsErrors" contains an Assign "AssignData" as
	  | variable      | value |
	  | [[inputData]] | hello |
	  And "TestAssignWithRemoteOutputsErrors" contains "WorkflowUsedBySpecs" from server "Remote Connection Integration" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  | inputData        | [[inputData]] | output              | [[output]]       |
	  |                  |               | values(*).up     | [[values().&up]] |
	  |                  |               | values(*).low     | [[values().low]] |
	  When "TestAssignWithRemoteOutputsErrors" is executed
	  Then the "TestAssignWithRemoteOutputsErrors" workflow execution has "AN" error
	  And the "AssignData" in WorkFlow "TestAssignWithRemoteOutputsErrors" debug inputs as
	  | # | Variable        | New Value |
	  | 1 | [[inputData]] = | hello     |
	  And the "AssignData" in Workflow "TestAssignWithRemoteOutputsErrors" debug outputs as    
	  | # |                       |
	  | 1 | [[inputData]] = hello |
	   And the "WorkflowUsedBySpecs" in WorkFlow "TestAssignWithRemoteOutputsErrors" debug inputs as
	  |                       |
	  | [[inputData]] = hello |
	  And the "Setup Assign (1)" in Workflow "WorkflowUsedBySpecs" debug outputs as
	  | # |                |
	  | 1 | [[in]] = hello |
	  And the "Convert Case (1)" in Workflow "WorkflowUsedBySpecs" debug outputs as
	  | # |                |
	  | 1 | [[in]] = HELLO |
	  And the "Final Assign (3)" in Workflow "WorkflowUsedBySpecs" debug outputs as
	  | # |                             |
	  | 1 | [[output]] = HELLO          |
	  | 2 | [[values(1).up]] = HELLO |
	  | 3 | [[values(1).low]] = hello |	  	 

Scenario Outline: Workflow to Workflow Mappings 
Given I have a workflow "<Name>"
And "<Name>" contains an Assign "AssignData" as
        | variable         | value         |
        | <AssignVariable> | <AssignValue> |
And "<Name>" contains "WorkflowMappingsInnerWorkflow" from server "localhost" with mapping as
| From Variable  | Input to Service | Output from Service | To Variable  |
| <FromVariable> | <ToService>      | <FromService>       | <ToVariable> |
When "<Name>" is executed
Then the workflow execution has "NO" error
And the "WorkflowMappingsInnerWorkflow" in WorkFlow "<Name>" debug inputs as
      |                        |
      | <ToServiceAssignValue> |	  
And the "WorkflowMappingsInnerWorkflow" in Workflow "<Name>" debug outputs as
      |                        |
      |  <ToVariableAndResult> |
Examples: 
| Name                       | AssignVariable | AssignValue | FromVariable   | ToService  | FromService | ToVariable     | ToServiceAssignValue   | ToVariableAndResult    |
| ScalToRecInAndScaltoRecOut | [[OuterIn]]    | hello       | [[OuterIn]]    | in(*).in   | InnerOutput | [[out(*).out]] | [[in(1).in]] = hello   | [[out(1).out]] = hello |
| BlnkToRecIn                |                |             |                | in(*).in   | InnerOutput | [[OuterOut]]   |                        | [[OuterOut]] =         |
| BlnkToScalIn               |                |             |                | InnerInput | InnerOutput | [[OuterOut]]   |                        | [[OuterOut]] =         |
| HdCdScalToRecInSclToSclOut | [[OuterIn]]    | ll          | he[[OuterIn]]o | in(*).in   | InnerOutput | [[OuterOut]]   | [[in(1).in]] = hello   | [[OuterOut]] = hello   |
| RecToRecInAndRecOut        | [[rec().out]]  | hello       | [[rec().out]]  | in(*).in   | InnerOutput | [[out(*).out]] | [[in(1).in]] = hello   | [[out(1).out]] = hello |
| ScalToScalIn&ScalOut       | [[OuterIn]]    | hello       | [[OuterIn]]    | InnerInput | InnerOutput | [[OuterOut]]   | [[InnerInput]] = hello | [[OuterOut]] = hello   |
| Static                     |                |             | hello          | in(*).in   | InnerOutput | [[out(*).out]] | [[in(1).in]] = hello   | [[out(1).out]] = hello |
| RecToScalOut               | [[rec().in]]   | hello       | [[rec().in]]   | InnerInput | InnerOutput | [[Output]]     | [[InnerInput]] = hello | [[Output]] = hello     |
| RecToBlank                 | [[rec().in]]   | hello       | [[rec().in]]   | InnerInput | InnerOutput |                | [[InnerInput]] = hello |                        |
| ScalToBlank                | [[var]]        | hello       | [[var]]        | InnerInput | InnerOutput |                | [[InnerInput]] = hello |                        |


 Scenario: Executing Asynchrounous testing workflow base
	  Given I have a workflow "Testing - Async Test Master Testc"
	  And "Testing - Async Test Master Testc" contains "Async Test Master" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable      |
	  When "Testing - Async Test Master Testc" is executed
	  Then the workflow execution has "NO" error
	  And the "Async Test Master" in Workflow "Async Test Master" debug outputs as
	  |                      |
	  | [[Result]] = Pass |

Scenario: MYSQL backward Compatiblity
	Given I have a workflow "MySQLMigration"
	And "MySQLMigration" contains "MySQLDATA" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service                | To Variable                    |
      |                  |               | [[dbo_GetCountries().CountryID]]   | dbo_GetCountries().CountryID   |
      |                  |               | [[dbo_GetCountries().Description]] | dbo_GetCountries().Description |
	When "MySQLMigration" is executed
	Then the workflow execution has "NO" error

Scenario: Data connector backward Compatiblity
	Given I have a workflow "DataMigration"
	And "DataMigration" contains "DataCon" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service                | To Variable                    |
      | [[ProductId]]    | productId     | [[dbo_GetCountries().CountryID]]   | dbo_GetCountries().CountryID   |
      |                  |               | [[dbo_GetCountries().Description]] | dbo_GetCountries().Description |
	When "DataMigration" is executed
	Then the workflow execution has "NO" error

Scenario: Mappings from nested workflow
	Given I have a workflow "OutterWolf1371"
	And "OutterWolf1371" contains "Wolf-1371" from server "localhost" with mapping as
         | Input to Service | From Variable | Output from Service | To Variable |
         | [[b]]            | b             | a                   | [[a]]       |
	When "OutterWolf1371" is executed
	Then the workflow execution has "NO" error

Scenario: Plugin connector backward Compatiblity
	Given I have a workflow "PluginMigration"
	And "PluginMigration" contains "PluginService" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service      | To Variable          |
      | [[s]]            | s             | [[PrimitiveReturnValue]] | PrimitiveReturnValue |
	When "PluginMigration" is executed
	Then the workflow execution has "NO" error

Scenario: Executing WF on a remote server 
         Given I have a workflow "Testing - TestRemoteTools"
         And "Testing - TestRemoteTools" contains "TestRemoteTools" from server "Remote Connection Integration" with mapping as
         | Input to Service | From Variable | Output from Service | To Variable      |
         When "Testing - TestRemoteTools" is executed
         Then the workflow execution has "NO" error     

		 
Scenario: ForEach with NestedStarTest and Inner WF
	  Given I have a workflow "ForEach Output2"
	  And "ForEach Output2" contains "TestInnerWFForEachOutputs" from server "localhost" with mapping as
	| Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  When "ForEach Output2" is executed
	Then the workflow execution has "NO" error
	And the "TestInnerWFForEachOutputs" in Workflow "ForEach Output2" debug outputs as
	  |                      |
	  | [[Result]] = Pass |

Scenario: Workflow with Performance counters
	  Given I have a workflow "PerfCounterTest"
	  And I have reset local perfromance Counters
	  And "PerfCounterTest" contains "PerfCounter" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  When "PerfCounterTest" is executed
	Then the perfcounter raw values are
	| Name                                              | Value |
	| Average workflow execution time                   | x     |
	| Concurrent requests currently executing           | 0     |
	| Count of Not Authorised errors                    | 0     |
	| Total Errors                                      | 4     |
	| Request Per Second                                | x     |
	| Count of requests for workflows which don’t exist | 9     |

Scenario: Sharepoint Acceptance Tests
	  Given I have a workflow "Sharepoint Acceptance Tests Outer"
	  And "Sharepoint Acceptance Tests Outer" contains "Sharepoint Connectors Testing" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  When "Sharepoint Acceptance Tests Outer" is executed
	Then the workflow execution has "NO" error
	  And the "Sharepoint Connectors Testing" in Workflow "Sharepoint Acceptance Tests Outer" debug outputs as
	  |                   |
	  | [[Result]] = Pass |

Scenario: ForEach using * in CSV executed as a sub execution passes out an ordered recordset
	  Given I have a workflow "Spec - Test For Each Shared Memory"
	  And "Spec - Test For Each Shared Memory" contains "Test For Each Shared Memory" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  When "Spec - Test For Each Shared Memory" is executed
	  Then the workflow execution has "NO" error	  
	  And the "Test For Each Shared Memory" in Workflow "Spec - Test For Each Shared Memory" debug outputs as
	  |                      |
	  | [[Result]] = Pass |

Scenario: Ensure that End this Workflow is working 
	  Given I have a workflow "EndNestedWorkflows"
	  And "EndNestedWorkflows" contains "Testing/Bugs/wolf-402" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  When "EndNestedWorkflows" is executed
	Then the workflow execution has "NO" error

Scenario: Xml Serialisation bug when returning xml
	Given I have a workflow "XmlSerialisation"
	And "XmlSerialisation" contains "Testing/Bugs/wolf-829" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	When "XmlSerialisation" is executed
	Then the workflow execution has "NO" error

Scenario: Mixing Scalar And Recordset bug 
	Given I have a workflow "MixingScalarAndRecordset"
	And "MixingScalarAndRecordset" contains "Testing/Bugs/Wolf-860" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	When "MixingScalarAndRecordset" is executed
	Then the workflow execution has "NO" error

Scenario: ForEach using * and web get request with error
	  Given I have a workflow "Spec - Test For Each  Get"
	  And "Spec - Test For Each  Get" contains "GetRequestErrorHandling" from server "localhost" with mapping as
	  | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  When "Spec - Test For Each  Get" is executed
	  Then the workflow execution has "AN" error	  
	  And the "GetRequestErrorHandling" in Workflow "Spec - Test For Each  Get" debug outputs as
	  |                   |
	  | [[Result]] = Pass |


Scenario: Error not bubbling up
	Given I have a workflow "Wolf-1212_Test"
	And "Wolf-1212_Test" contains "ErrorHandled" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	  |                  |               | Error              | [[Error]]  |
	When "Wolf-1212_Test" is executed
	Then the workflow execution has "NO" error
	And the "ErrorHandled" in Workflow "Wolf-1212_Test" debug outputs as
	  |                                                                                                                  |
	  | [[Result]] = Fail                                                                                                |
	  | [[Error]] = Could not parse input datetime with given input format (if you left the input format blank then even |


Scenario: Error not bubbling up error message
	Given I have a workflow "Wolf-1212_2"
	And "Wolf-1212_2" contains "ErrorBubbleUp" from server "localhost" with mapping as
      | Input to Service | From Variable | Output from Service | To Variable |
	  |                  |               | Result              | [[Result]]  |
	When "Wolf-1212_2" is executed
	Then the workflow execution has "NO" error
	And the "ErrorBubbleUp" in Workflow "Wolf-1212_2" debug outputs as
	  |                   |
	  | [[Result]] = Pass |