## DPS923 MAP523 Assignment 7 - Fetch, load, query

Assignment 7 enables you to continue working with the network and Core Data, separately and/or together. Three separate small apps will enable you to get experience with some common mobile app patterns.  
<br>

> This document is being edited.  
> This notice will be removed when the edits are complete.  

<br>

### Due date
Wednesday, March 22, 2017, at 11:00pm ET  
Grade value: 5% of your final course grade  

*If you wish to submit the assignment before the due date and time, you can do that.*  
<br>

### Objective(s)
Use the network, and a public web service.  
Save data (from a plist file, and from the network) into a Core Data store.  
Round-trip data, over the network, to a web service.  
Implement differently-configured fetch requests to query a Core Data store.  
Continue using the foundation topics from previous classes.  
<br>

### Introduction to the problem that you will solve
In this assignment, you will create three separate small apps. Each will enable you to learn and get experience in a common mobile app interaction and data-handling pattern.  

(Your teacher team decided that it was better to do three separate small apps, instead of attempting to create an all-in-one app scenario.)  

**App 1 - Plan Tour**: Enable a user to make reservations for a full-day tour of Toronto. Data is sent to a web service, which processes the data and returns a response that confirms the reservation.  

**App 2 - Players**: Load the NFL quarterback player data into a Core Data store (on first run of the app). Then, support querying, using *fetch request* objects.  

**App 3 - Courses**: Loads School of ICT academic course data into a Core Data store (on first run of the app). Then, support querying, using *fetch request* objects. 

> Screen captures will be posted  

App 1 - Plan Tour - screen captures:  
<kbd>![Startup](images/a7-tour-request.png)</kbd>&nbsp;&nbsp;<kbd>![Startup](images/a7-tour-response.png)</kbd>  
<br>

### App 1 - Plan Tour
Get (download) the new *CombinedModel* app, which is in the GitHub repo. (Its path is notes/Project_Templates).  

Follow the instructions in its Readme.txt, to create an iOS app named **PlanTour**.  

> IMPORTANT!  
> The WebServiceRequest.swift source code file was updated again to add support for the HTTP POST and PUT methods.  
> If you downloaded the new *CombinedModel* app BEFORE Sunday, March 19, at 11:30am, then you have an old or obsolete version of the WebServiceRequest.swift source code file.  
> Before continuing, replace your existing WebServiceRequest.swift source code file with the new file.  

<br>

#### Verify that the app runs
First, run the app in the iOS Simulator, so that you know that it does successfully run. It will display a list of academic programs offered by the School of ICT, because that's what the project template does, by default. We will replace that functionality with our own.  

#### Task preview
In the sections that follow, you will perform these tasks:  
1. (more to come)  

### Storyboard and controller work
On the storyboard, the existing navigation controller and view controller can be deleted. We will need a single scene, a standard view controller, so you can leave that on the storyboard, if you wish.  

Add a new view controller (Swift) code file to the project. Its name will not matter much, so you can name it "TourHome" or something like that. Adopt the WebServiceRequestDelegate.  

> More work on this  
> add code to wsr
> iso 8601 date

It will need a reference to the model. While you're thinking about this, edit the app delegate, and set a reference to this new view controller, instead of the original nav + table view.    

Back on the storyboard, set the custom class to the just-added controller. Also, configure it to be the "initial" view controller.  
<br>

#### UI, outlets and actions
From top to bottom, the scene will have the following user interface objects. Some will need labels (use your judgement).  

Text field (outlet): For the name(s) of the people who want to go on the tour.  

Segmented control (outlet): With 6 segments, and segment titles 1 through 6.  

Date picker (outlet): Date mode (no time).  

Button (action and outlet): For the "Buy" action. We need an outlet so that we can disable/enable user interaction with the button.   

Button (action): For the "Clear" action.  

Text view (outlet): Displays data from the web service response.  
<br>

### Web service
A web service has been configured to listen for tour requests. It is designed to accept a package of data in a HTTP POST request, and respond with synthesized info about the tour.  

The web service resource URL is:  
```
https://ios2017.azurewebsites.net/api/tours
```

It supports HTTP GET, but the response will simply tell you the following:  

The request must have these settings:
POST method
Content type is application/json
It needs a request with this data:  
* CustomerName - string, length 2 to 100 characters  
* NumberOfCustomers - integer, ranging from 1 through 6  
* TourDate - string, a valid date in ISO 8601 format (see note below)  

The response will include:  
* The three data items in the request, unchanged  
* Id - integer, an identifier  
* Message - string, information about the tour  
* ReservationCode - string, a reservation (confirmation) code  
* DateCreated - string, in ISO 8601 format  

Use Postman (or similar) to interact with the web service. Create a request, and send it. The data format is JSON, so write/create a suitable JSON object. Study the response.  

#### ISO 8601 dates
Many JSON interactions with web services use the ISO 8601 standard for dates and times. At a minimum, it needs a date, and hours and minutes. A full representation needs seconds and detailed time zone information.  

We will use the "minimum" format. For example, the ISO 8601 date format for Friday at noon is:  
```
2017-03-17T12:00Z
```
<br>

### Controller work
(Response will include the data entered, plus a reservation number/code, and a date-and-time stamp; display the data on the lower part of the screen)  

Also / new:  
Background photo, washed out (translucent)  

<br><br><br><br><br>
( more to come )
<br><br><br><br><br>

### App 2 - Players
Get (download) the new *CombinedModel* app, which is in the GitHub repo. (Its path is notes/Project_Templates).  

Follow the instructions in its Readme.txt, to create an iOS app named **Players**.  

#### Verify that the app runs
First, run the app in the iOS Simulator, so that you know that it does successfully run. It will display a list of academic programs offered by the School of ICT, because that's what the project template does, by default. We will replace that functionality with our own.  

#### Task preview
In the sections that follow, you will perform these tasks:  
1. (more to come)  

Create a Core Data model that will hold NFL quarterback data  
On first launch, app will open a plist file, and add the contents to the Core Data store  
Nav style app, with a home scene that has two (or three, to be decided) buttons  
One button runs a query (fetch request) that selects the "top 5" quarterbacks by "rating" (sorted)  
The results are displayed on a list (table view controller)  
Another button runs a query (fetch request) that fetches all quarterbacks who play for teams that begin with the letters "C" or "D" (sorted)  
The results are displayed on a list (table view controller)  

URL (use Postman to inspect):  
http://(tba).azurewebsites.net/api/tours  

<br><br><br><br><br>
( more to come )
<br><br><br><br><br>

### App 3 - Courses
Get (download) the new *CombinedModel* app, which is in the GitHub repo. (Its path is notes/Project_Templates).  

Follow the instructions in its Readme.txt, to create an iOS app named **Courses**.  

#### Verify that the app runs
First, run the app in the iOS Simulator, so that you know that it does successfully run. It will display a list of academic programs offered by the School of ICT, because that's what the project template does, by default. We will replace that functionality with our own.  

#### Task preview
In the sections that follow, you will perform these tasks:  
1. (more to come)  

Create a Core Data model that will hold School of ICT course data  
On first launch, app will call a web service, and add the response/contents to the Core Data store  
Nav style app, with two levels, list scene (table view) and details scene (standard view)  
The list (table view) will show relevant info about courses  
When the user taps/selects a row, the way that we get the data for the details scene *will be different* from what you have learned - we will use the unique object identifier (NSManagedObjectID) to query (fetch request) the Core Data store for the item that we want to display  

URLs (use Postman to inspect):  
https://ict.senecacollege.ca/api/courses/in/cpa  
https://ict.senecacollege.ca/api/courses/in/bsd  

<br><br><br><br><br>
( more to come )
<br><br><br><br><br>


### Test your work
Run the app on the iOS Simulator, using different devices (that have different screen sizes):  
1. iPhone SE or 5 (4-inch screen)  
2. iPhone 7 (4.7-inch screen)  
3. iPhone 7 Plus (5.5-inch screen)  

Make sure that the content lays out nicely, in portrait mode, on all of these screen sizes.  
<br>

#### Borrowing a device
If you have an iOS device, great, please use it in this course. 

If you do not have an iOS device, the School of ICT has a limited supply of iPod touch devices available for loan. Contact Professor McIntyre to request a device.  
<br>

#### Show / prove that your apps work
Final testing of your apps must be on a device. Then, take a few screenshots that shows/proves that your app works.  

Screenshots can be taken:
- on the device itself
- using the Xcode Devices window (on the Window menu), you can use the "take screenshot" button, and it will be stored on the desktop.
- in the Simulator, File>Screenshot, it will store the file on the desktop

Submit the screenshots with your project. Put them in the project folder, before doing the zip task.  
<br>

### Submitting your work
Follow these instructions to submit your work:  

> Note - special instructions, because you will submit all three (3) apps...  

1. Make sure your apps work correctly  
2. Locate each project folder in Finder  
3. Select all three (using click, then Command+click, then Command+click)  
4. Right-click a selected folder, and choose **Compress 3 items**, which creates a zip file (make sure the zip file is fairly small, around 1MB or less)  
5. Login to Blackboard/My.Seneca, and in this course's Assignments area, look for the upload link, and submit your work there  