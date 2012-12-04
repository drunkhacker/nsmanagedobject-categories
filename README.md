NSManagedObject+Convenients
==========================

### Overview

Using CoreData is now being essential part of iOS application
development. But due to its cumbersome syntax, CoreData programming
wasn't pleasure thing. Typing all `NSManagedObjectContext`,
`NSEntityDescription` things is one of a key reason of CoreData
programming difficulties.

So, these bunch of Objective-C categories for `NSManagedObject` or
`NSManagedObjectContext` are written. These categories support
convenient methods to create/retrieve CoreData `NSManagedObject`s.  

It supports

* Basic CRUD methods for `NSManagedObject`
* `NSDate` and `NSArray` persistency to CoreData
* Automatically detect CamelCase and under_score key of `NSDictionary`
* Timestamp methods for tracking the last updated time of resources

### Motivating Example

It is typical thing to access API server to get some _Resource_ and persist them to _CoreData_ for caching purpose. The most common representation of a resource is _JSON_. And a JSON object is easily converted to `NSDictionary` using many existing JSON parsers. 

Say, your server has resources named `User` and your iOS application wants to save in CoreData. 

```` objective-c
#import "User.h" //a CoreData model
#import "NSManagedObject+Convenients.h" //Simply you import it and taste goodies
    
NSURL *url = [NSURL URLWithString:@"https://api.awesome-service.com/users/42"];
NSURLRequest *request = [NSURLRequest requestWithURL:url];

AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
  success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary *JSON) {
  NSError *err;
  
  //Using categories doesn't require additional setups
  User *user = [User insertWithDictionary:JSON error:&err];
  
  //you are good to go with `user`
  
} failure:nil];
````

### More Details
See sample project's unit test file for more deatils

