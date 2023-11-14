// Required Modules
const express = require('express');
const mysql = require('mysql');
const moment = require('moment');
const cors = require('cors')
const nodemailer = require('nodemailer');

const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }));

const ejs = require('ejs');
app.set('view engine', 'ejs');
app.use(cors())

var PNRNumber;
var TrainNumber;
var TrainName;
var Class;
var Coach;
var SeatNumber;
var DateOfJourney;
var Origin;
var Destination;
var Departure;
var Arrival;
var UserID;
var Fare;

var finalDetails = {
  PNRNumber,
  TrainNumber,
  TrainName,
  Class,
  Coach,
  SeatNumber,
  DateOfJourney,
  Origin,
  Destination,
  Departure,
  Arrival,
  UserID,
  Fare
}

// Configure MySQL connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'railwaydb'
});

// // Configure MySQL connection
// const db = mysql.createConnection({
//   host: 'sql12.freemysqlhosting.net',
//   user: 'sql12661968',
//   password: 'wSdYb9Uwy7',
//   database: 'sql12661968'
// });

var username;
var name;
var email;
var birthdate;
var documentType;
var documentNumber;
var gender;
var password;

var regDetails = {
  username,
  name,
  email,
  birthdate,
  documentType,
  documentNumber,
  gender,
  password
}

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Database Connection Failed: ' + err.stack);
    return;
  }
  console.log('Database Connection Successful!');
});

// Function to get the Day from a Date
function getDayFromDate(dateString) {
  const possibleDateFormats = [
    'YYYY-MM-DD', 'MM/DD/YYYY', 'DD-MM-YYYY', 'YYYY/MM/DD', 'MM-DD-YYYY', 'DD/MM/YYYY'
  ];

  let date;
  for (const format of possibleDateFormats) {
    date = moment(dateString, format, true);
    if (date.isValid()) {
      break;
    }
  }

  if (date && date.isValid()) {
    const daysOfWeek = ['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY'];
    const dayOfWeek = date.day();
    const dayName = daysOfWeek[dayOfWeek];

    return dayName;
  } else {
    return 'Invalid Date Dormat';
  }
}

// To enable use of CSS, HTML...
app.use(express.static('public'));
app.use(express.static('./'));

// Index Route
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

// Route for the Registration Page
app.get('/register', (req, res) => {
  res.sendFile(__dirname + '/public/reg.html');
});

app.post('/register', (req, res) => {
  regDetails.username = req.body.username;
  regDetails.name = req.body.name;
  regDetails.email = req.body.email;
  regDetails.birthdate = req.body.birthdate;
  regDetails.documentType = req.body.documentType;
  regDetails.documentNumber = req.body.documentNumber;
  regDetails.gender = req.body.gender;
  regDetails.password = req.body.password;

  res.redirect('/verify');
});

let OTP;

function generateOTP() {
  const otp = Math.floor(100000 + Math.random() * 900000);
  return otp.toString();
}

// Nodemailer setup for sending emails
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'rohitmishra21022002@gmail.com', // Enter Email Address 
    pass: 'arrffarihydkicgp' // Enter App Password   
  }
});

app.get('/verify', (req, res) => {
  OTP = generateOTP();
  console.log("Your OTP is " + OTP);

  // Email configuration
  const mailOptions = {
    from: 'rohitmishra21022002@gmail.com', // Enter Email Address
    to: regDetails.email,
    subject: 'OTP for VistaRail Registration',
    text: `Your OTP for email verification is: ${OTP}`
  };

  // Send email
  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error(error);
      res.status(500).send('Error sending OTP via email.');
    } else {
      console.log('Email sent: ' + info.response);
      res.status(200).send('OTP sent successfully. Check your email.');
    }
  });

  res.sendFile(__dirname + '/public/verify.html');
});

app.post('/verify', (req, res) => {
  const userOTP = req.body.otp;

  if (userOTP === OTP) {
    db.query(
      'INSERT INTO userdetails (NAME, USERNAME, EMAIL_ID, DATE_OF_BIRTH, PASSWORD, DOCUMENT_ID_TYPE, DOCUMENT_ID_NUMBER, GENDER) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [name, username, email, birthdate, password, documentType, documentNumber, gender],
      (err) => {
        if (err) {
          if (err.code === 'ER_DUP_ENTRY') {
            if (err.sqlMessage.includes('USERNAME')) {
              res.send("<script>if(confirm('Username already exists. Please choose a different username.')) { window.location = '/register'; } else { window.location = '/register'; } </script>")
            } else if (err.sqlMessage.includes('DOCUMENT_ID_NUMBER')) {
              res.send("<script>if(confirm('Document ID number already exists. Please use a different one.')) { window.location = '/register'; } else { window.location = '/register'; } </script>")
            } else if (err.sqlMessage.includes('EMAIL_ID')) {
              res.send("<script>if(confirm('Email ID already exists. Please use a different one.')) { window.location = '/register'; } else { window.location = '/register'; } </script>")
            } else {
              res.send("<script>alert('Registration Failed: " + err.message + "');</script>");
            }
          } else {
            console.error('Registration Error: ' + err.message);
            res.send("<script>alert('Registration Failed: " + err.message + "');</script>");
            // res.json("Registration Failed");
          }
        } else {
          // res.json("Registration Successful");
          res.send("<script>if(confirm('Registration Successful!')) { window.location = '/log_in'; } else { window.location = '/log_in'; } </script>")
        }
      }
    );
  } else {
    res.json("Wrong OTP");
  }
});

// Route for the Login Page
app.get('/login', (req, res) => {
  const { trainNumber, origin, destination } = req.query;
  finalDetails.TrainNumber = trainNumber;
  finalDetails.Origin = origin;
  finalDetails.Destination = destination;
  res.sendFile(__dirname + '/public/login.html');
});

// Routing for the Login Page
app.get('/log_in', (req, res) => {
  res.sendFile(__dirname + '/public/login.html');
});

app.post('/login', (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  const query = 'SELECT * FROM userdetails WHERE USERNAME = ? AND PASSWORD = ?';

  db.query(query, [username, password], (err, results) => {
    if (err) {
      console.error('Error in query: ' + err.message);
      return res.status(500).json({ success: false, message: 'Login Failed' });
    }
    if (results.length === 1) {
      finalDetails.UserID = results[0].USER_ID;
      // res.json({"success": true, "id": results[0].USER_ID});
      res.redirect('/searchResult');
    } else {
      res.send("<script>if(confirm('Invalid Username or Password!')) { window.location = '/log_in'; } else { window.location = '/log_in'; } </script>");
      // res.json({ "success": false, "message": "Invalid Username or Password" });
    }
  });
});

// Route for About
app.get('/about', (req, res) => {
  res.sendFile(__dirname + '/public/about.html');
});

app.get('/getall', (req, res) => {
  res.json(finalDetails);
})

// Route for Trains Between Stations
app.get('/trainBetweenStations', (req, res) => {
  res.sendFile(__dirname + '/public/checkTrains.html');
});

app.post('/trainBetweenStations', (req, res) => {
  const origin = req.body.origin;
  const destination = req.body.destination;
  const sql = `
    SELECT * FROM trainschedule
    WHERE ORIGIN = ? AND DESTINATION = ?
  `;
  db.query(sql, [origin, destination], (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }

    if (results.length === 0) {
      // No trains available between the provided stations
      // res.json("No trains available between these stations.");
      res.send("<script>if(confirm('No trains available between these stations!')) { window.location = '/trainBetweenStations'; } else { window.location = '/trainBetweenStations'; } </script>")
      return;
    }
    res.render('trainBetweenStationsList', { trainData: results });
    // res.json(results);
  });
});

// Route for all the cities
app.get('/cities', (req, res) => {
  const sql = 'SELECT STATION_NAME FROM stations';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }

    const cityNames = results.map((result) => result.STATION_NAME);
    res.json(cityNames);
  });
});

// Route for the Booking Page
app.get('/book', (req, res) => {
  res.sendFile(__dirname + '/public/book.html');
});

app.post('/book', (req, res) => {
  const origin = req.body.origin;
  const destination = req.body.destination;
  const journeyDate = req.body.journeyDate;
  let day = getDayFromDate(journeyDate);
  const sql = `
    SELECT * FROM trainschedule
    WHERE ORIGIN = ? AND DESTINATION = ? AND ${day} = 1
  `;
  finalDetails.DateOfJourney = journeyDate;
  db.query(sql, [origin, destination, journeyDate], (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }
    res.render('trainList', { trainData: results });
    // res.json(results);
  });
});

// Route for the search result
app.get('/searchResult', (req, res) => {
  const sql = `
    SELECT * FROM trainschedule
    WHERE TRAIN_NO = ${finalDetails.TrainNumber} AND 
    ORIGIN = "${finalDetails.Origin}" AND DESTINATION = "${finalDetails.Destination}"
  `;

  db.query(sql, [finalDetails.TrainNumber, finalDetails.Origin, finalDetails.Destination], (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }
    // res.json(results);
    res.render('trainFinal', { trainData: results });
  });

});

// Route for the search result
app.get('/confirmBooking', (req, res) => {
  const { trainNumber, trainName, origin, destination, departure, arrival, Class } = req.query;

  const sql = `
    SELECT * FROM trainschedule
    WHERE TRAIN_NO = ? AND ORIGIN = ? AND DESTINATION = ?
  `;

  finalDetails.TrainName = trainName;
  finalDetails.TrainNumber = trainNumber;
  finalDetails.Departure = departure;
  finalDetails.Arrival = arrival;
  finalDetails.Class = Class;
  finalDetails.Origin = origin;
  finalDetails.Destination = destination;


  db.query(sql, [trainNumber, origin, destination], (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }

    seat = 'SEATS_' + Class;
    if (results[0][seat] < 1) {
      res.json(
        "no seats available"
      );
    } else {
      const sql = `
        UPDATE trainschedule SET ${seat} = ${seat} - 1
        WHERE TRAIN_NO = ? AND ORIGIN = ? AND DESTINATION = ?
      `;
      db.query(sql, [trainNumber, origin, destination], (err, results) => {
        if (err) {
          console.error('Error Fetching Data: ' + err);
          res.status(500).json({ error: 'Error Fetching Data' });
          return;
        }
      });

    }

    if (Class === "Sleeper") {
      finalDetails.Fare = results[0].FARE_SLEEPER;
    } else if (Class === "1AC") {
      finalDetails.Fare = results[0].FARE_1AC;
    } else if (Class === "2AC") {
      finalDetails.Fare = results[0].FARE_2AC;
    } else if (Class === "3AC") {
      finalDetails.Fare = results[0].FARE_3AC;
    }

    res.render('confirmBooking', { ticket: finalDetails });
    // res.json(finalDetails);
  });
});

// Function to generate PNR Number
function getPNR() {
  return Math.floor(1000000000 + Math.random() * 9000000000);
}

// Function to get Coach
function getCoach(finalDetail) {
  switch (finalDetail.Class) {
    case "3AC":
      return "B" + (Math.floor(Math.random() * 8) + 1);
    case "2AC":
      return "A" + (Math.floor(Math.random() * 4) + 1);
    case "1AC":
      return "H1";
    case "Sleeper":
      return "S" + (Math.floor(Math.random() * 13) + 1);
    default:
      return null;
  }
}

// Function to get Seat Number
function getSeat(finalDetail) {
  switch (finalDetail.Class) {
    case "3AC":
      return Math.floor(Math.random() * 72) + 1;
    case "2AC":
      return Math.floor(Math.random() * 54) + 1;
    case "1AC":
      return Math.floor(Math.random() * 20) + 1;
    case "Sleeper":
      return Math.floor(Math.random() * 90) + 1;
    default:
      return null;
  }
}

app.get('/ticketConfirmation', (req, res) => {
  let pnr = getPNR();

  const selectSQL = `
    SELECT * 
    FROM ticketdetails
    WHERE PNR = ?;
  `;

  db.query(selectSQL, [pnr], (selectErr, selectResults) => {
    if (selectErr) {
      console.error('Error Fetching Data: ' + selectErr);
      return res.status(500).json({ error: 'Error Fetching Data' });
    }

    if (selectResults.length > 0) {
      pnr = getPNR();
    }

    finalDetails.PNRNumber = pnr;
    finalDetails.Coach = getCoach(finalDetails);
    finalDetails.SeatNumber = getSeat(finalDetails);

    const insertSQL = `
    INSERT INTO ticketdetails
    VALUES (
      ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
    );
    `;

    db.query(insertSQL, [
      finalDetails.PNRNumber,
      finalDetails.TrainNumber,
      finalDetails.TrainName,
      finalDetails.Class,
      finalDetails.Coach,
      finalDetails.SeatNumber,
      finalDetails.DateOfJourney,
      finalDetails.Origin,
      finalDetails.Destination,
      finalDetails.Departure,
      finalDetails.Arrival,
      finalDetails.UserID,
      1,                    // Assuming 1 passenger for simplicity
      finalDetails.Fare
    ], (insertErr, insertResults) => {
      if (insertErr) {
        console.error('Error Inserting Data: ' + insertErr);
        return res.status(500).json({ error: 'Error Inserting Data' });
      }

      res.render('ticketConfirm', { finalDetails });
      // console.log(finalDetails)
      // res.json(finalDetails);
    });
  });
});

// Route for the findBooking Page
app.get('/findBooking', (req, res) => {
  res.sendFile(__dirname + '/public/findBooking.html');
});

app.post('/findBooking', (req, res) => {
  const pnrNumber = req.body.pnrNumber;
  const sql = `
    SELECT * 
    FROM ticketdetails
    WHERE PNR = ?
  `;

  db.query(sql, [pnrNumber], (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }
    // res.json(results);
    res.render('ticketDetail', { ticketData: results });
  });
});

// Route for Cancel Page
app.get('/signin', (req, res) => {
  cancelPNR = req.query.PNR;
  const sql = `
    SELECT * 
    FROM ticketdetails
    WHERE PNR = ?
  `;
  // console.log("canclePNR = " + cancelPNR); // Working
  db.query(sql, [cancelPNR], (err, results) => {
    if (err) {
      console.error('Error Fetching Data: ' + err);
      res.status(500).json({ error: 'Error Fetching Data' });
      return;
    }
    cancelSeat = "SEATS_" + results[0].CLASS;
    cancelTrainNo = results[0].TRAIN_NO;
    cancelOrigin = results[0].ORIGIN;
    cancelDestination = results[0].DESTINATION;
    cancelUserID = results[0].USER_ID;

  });
  res.sendFile(__dirname + '/public/signin.html');
});

app.post('/signin', (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  const query = 'SELECT * FROM userdetails WHERE USERNAME = ? AND PASSWORD = ?';

  db.query(query, [username, password], (err, results) => {
    if (err) {
      console.error('Error in query: ' + err.message);
      return res.status(500).json({ success: false, message: 'Login Failed' });
    }
    // console.log(results);
    if (results.length === 1) {
      if (cancelUserID === results[0].USER_ID) {
        const sql = `
        UPDATE trainschedule SET ${cancelSeat} = ${cancelSeat} + 1
        WHERE TRAIN_NO = ? AND ORIGIN = ? AND DESTINATION = ?
      `;
        db.query(sql, [cancelTrainNo, cancelOrigin, cancelDestination], (err, results) => {
          if (err) {
            console.error('Error Fetching Data: ' + err);
            res.status(500).json({ error: 'Error Fetching Data' });
            return;
          }
        });

        const tktsql = `
        DELETE FROM ticketdetails
        WHERE PNR = ?;
        `

        db.query(tktsql, [cancelPNR], (err, results) => {
          if (err) {
            console.error('Error Fetching Data: ' + err);
            res.status(500).json({ error: 'Error Fetching Data' });
            return;
          }
        });
        res.send("<script>if(confirm('Booking Cancelled Successfully...')) { window.location = '/'; } else { window.location = '/'; } </script>")
        // res.json("Booking Cancelled Successfully");
      } else {
        res.send("<script>if(confirm('Something went wrong...')) { window.location = '/'; } else { window.location = '/'; } </script>")
        // res.json("Something went wrong");
      }
    }
  });
});

// Route for Booking History
app.get('/bookedTickets', (req, res) => {
  res.sendFile(__dirname + '/public/bookLogin.html');
});

app.post('/bookedTickets', (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  const query = 'SELECT * FROM userdetails WHERE USERNAME = ? AND PASSWORD = ?';

  db.query(query, [username, password], (err, results) => {
    if (err) {
      console.error('Error in query: ' + err.message);
      return res.status(500).json({ success: false, message: 'Login Failed' });
    }
    if (results.length > 0) {
      const userID = results[0].USER_ID;
      const sql = `
      SELECT * from ticketdetails
      WHERE USER_ID = ${userID};
      `
      db.query(sql, [], (err, results) => {
        if (err) {
          console.error('Error in query: ' + err.message);
          return res.status(500).json({ success: false, message: 'Login Failed' });
        }
        else {
          if (results.length > 0) {
            // res.json(results);
            res.render('bookingHistory', { ticketData: results });
          }
          else {
            // res.json("No Previous Bookings Available");
            res.send("<script>if(confirm('No Previous Bookings Available')) { window.location = '/'; } else { window.location = '/'; } </script>")
          }
        }
      });
    }
  });
});

// Route for Check Birth
app.get('/checkBerth', (req, res) => {
  res.sendFile(__dirname + '/public/checkBerth.html');
});

// Defining port of the server
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});