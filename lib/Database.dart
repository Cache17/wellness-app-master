import 'package:appwrite/appwrite.dart';
import 'saved_data.dart';

import 'auth.dart';

String databaseId = "65e955e072eb7d2905bf";

final Databases databases = Databases(client);

// Save the user data to appwrite database - not creating any new users through the app, implement if needed to create users through app

Future<void> saveUserData(String name, String email, String password) async {
  return await databases
      .createDocument(
          databaseId: databaseId,
          collectionId: "65e955efeef6f2f2a77f",
          documentId: ID.unique(),
          data: {
            "name": name,
            "email": email,
            "password": password,
          })
      .then((value) => print("Document Created"))
      .catchError((e) => print(e));
}

// get user data from the database

Future getUserData() async {
  final id = SavedData.getUserId();
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: "65e955efeef6f2f2a77f",
        queries: [
          Query.equal("userId", id),
        ]);

    SavedData.saveUserName(data.documents[0].data['name']);
    SavedData.saveUserEmail(data.documents[0].data['email']);
    print(data);
  } catch (e) {
    print(e);
  }
}

// Create new events

Future<void> createEvent(
    String name,
    String desc,
    String image,
    String location,
    String datetime,
    String createdBy,
    bool isInPersonOrNot,
    String guest,
    String sponsers) async {
  return await databases
      .createDocument(
          databaseId: databaseId,
          collectionId: "65e955efeef6f2f2a77f",
          documentId: ID.unique(),
          data: {
            "name": name,
            "description": desc,
            "image": image,
            "location": location,
            "datetime": datetime,
            "createdBy": createdBy,
            "isInPerson": isInPersonOrNot,
            "guests": guest,
            "sponsers": sponsers
          })
      .then((value) => print("Event Created"))
      .catchError((e) => print(e));
}

// Read all Events
Future getAllEvents() async {
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId, collectionId: "65e955efeef6f2f2a77f");
    return data.documents;
  } catch (e) {
    print(e);
  }
}

// rsvp an event

Future rsvpEvent(List participants, String documentId) async {
  final userId = SavedData.getUserId();
  participants.add(userId);
  try {
    await databases.updateDocument(
        databaseId: databaseId,
        collectionId: "65e955efeef6f2f2a77f",
        documentId: documentId,
        data: {"participants": participants});
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

// list all event created by the user

Future manageEvents() async {
  final userId = SavedData.getUserId();
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: "65e955efeef6f2f2a77f",
        queries: [Query.equal("createdBy", userId)]);
    return data.documents;
  } catch (e) {
    print(e);
  }
}

// update the edited event

Future<void> updateEvent(
    String name,
    String desc,
    String image,
    String location,
    String datetime,
    String createdBy,
    bool isInPersonOrNot,
    String guest,
    String sponsers,
    String docID) async {
  return await databases
      .updateDocument(
          databaseId: databaseId,
          collectionId: "65ea0edbdc577bb273b1",
          documentId: docID,
          data: {
            "name": name,
            "description": desc,
            "image": image,
            "location": location,
            "datetime": datetime,
            "isInPerson": isInPersonOrNot, //default is true
            "guests": guest,
          })
      .then((value) => print("Event Updated"))
      .catchError((e) => print(e));
}

// deleting an event

Future deleteEvent(String docID) async {
  try {
    final response = await databases.deleteDocument(
        databaseId: databaseId,
        collectionId: "65ea0edbdc577bb273b1",
        documentId: docID);

    print(response);
  } catch (e) {
    print(e);
  }
}

Future getUpcomingEvents() async {
  try {
    final now = DateTime.now();
    final response = await databases.listDocuments(
      databaseId: databaseId,
      collectionId: "65ea0edbdc577bb273b1",
      queries: [
        Query.greaterThan("datetime", now),
      ],
    );

    return response.documents;
  } catch (e) {
    print(e);
    return []; // Handle errors appropriately in your application
  }
}

Future getPastEvents() async {
  try {
    final now = DateTime.now();
    final response = await databases.listDocuments(
      databaseId: databaseId,
      collectionId: "65ea0edbdc577bb273b1",
      queries: [
        Query.lessThan("datetime", now),
      ],
    );

    return response.documents;
  } catch (e) {
    print(e);
    return [];
  }
}