/* 1.Update price of the ticket. */

CREATE VIEW compute_price AS SELECT ticket_337.PNR, ticket_337.TrainNo,  ticket_337.Departure, ticket_337.Arrival, route_337.Distance, fare_table_337.FarePerKm FROM ticket_337, route_337, fare_table_337 WHERE (ticket_337.TrainNo = route_337.Train_No AND ticket_337.Departure = route_337.FromName AND ticket_337.Arrival = route_337.ToName AND fare_table_337.TrainType = ticket_337.TrainType AND fare_table_337.CompartmentType = ticket_337.CompartmentType);

CREATE VIEW passenger_num AS select PNR, count(PNR) as numbers FROM passenger_337 GROUP by PNR;

UPDATE payment_info_337 AS p INNER JOIN compute_price AS cs ON p.PNR = cs.PNR INNER JOIN passenger_num AS pn ON cs.PNR = pn.PNR SET P.Price = cs.Distance * cs. FarePerKm * pn.numbers;

/* 2.Retrieve the all stations along route of the Trains along with the distance between the stations */
SELECT t.Train_No, t.T_Name, r.FromNo, r.ToNo, r.FromName, r.ToName from train_337 as t natural join route_337 as r where r.ToNo-r.FromNo=1;
 
/* 3.Retrieve the Train no of train which is leaving Bengaluru and arriving at Chennai with compartments availability greater than 10. */
SELECT DISTINCT r.Train_No from compartment_337 as c inner join route_337 as r where r.ToName ="Chennai" and r.FromName ="Bengaluru" and c.Availability>10;
 
/* 4.Retrieve first and last name of users who have booked a ticket with price greater than 500 */
SELECT DISTINCT user_337.Fname, user_337.LName FROM user_337 JOIN payment_info_337 ON payment_info_337.Price >500;
  
/* 5.Retrieve the first name, last name, DOB and ticket PNR if they’ve bought it for all users. */
SELECT user_337.Fname, user_337.LName,user_337.DOB FROM user_337 LEFT OUTER JOIN ticket_337 ON ticket_337.PNR;
  
/* 6.Retrieve the first name, last name,of the Users who have not bought a ticket. */
SELECT DISTINCT user_337.Fname, user_337.LName FROM user_337 LEFT OUTER JOIN ticket_337 ON ticket_337.UserID!=user_337.UserID;
  
/* 7.Retrieve the ticket PNR, Train number, travel date and along with all users first name and last name. */
SELECT ticket_337.PNR, ticket_337.TrainNo, ticket_337.TravelDate, user_337.Fname, user_337.LName FROM ticket_337 RIGHT OUTER JOIN user_337 ON ticket_337.UserID = user_337.UserID;
   
/* 8.Retrieve the user id if they’ve traveled in a train along with train id and name of all trains */
SELECT ticket_337.UserID, train_337.Train_No, train_337.T_Name FROM ticket_337 RIGHT OUTER JOIN train_337 ON train_337.Train_No = ticket_337.TrainNo;
 
/* 9.Retrieve the train no and name of trains whose destination is not Mangaluru and distance is not less than 100km and departure time is not 8:30:00 PM. */ 
SELECT train_337.Train_No, train_337.T_Name FROM train_337 WHERE train_337.Destination != 'Mangaluru' AND train_337.Train_No NOT IN (SELECT DISTINCT route_337.Train_No FROM route_337 WHERE route_337.Distance<100) AND train_337.Train_No IN (SELECT DISTINCT ticket_337.TrainNo FROM ticket_337 WHERE ticket_337.DepartureTime != '20:30:00');

/* 10.Retrieve the User ID who has spent more ticket price than the average ticket price. */
SELECT ticket_337.UserID from ticket_337 WHERE ticket_337.PNR IN (SELECT payment_info_337.PNR FROM payment_info_337  WHERE payment_info_337.Price > (SELECT AVG(Price) FROM payment_info_337));
 