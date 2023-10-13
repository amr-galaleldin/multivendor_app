const nodemailer = require("nodemailer");
class Helper {
  static sendMail(email, subject, text) {
    // Create a transporter object using SMTP
    const transporter = nodemailer.createTransport({
      //   host: 'smtp.gmail.com',
      //   port: 587,

      service: "gmail",
      auth: {
        user: "ahmedmoanis@std.mans.edu.eg",
        pass: "ljfn ryqp obww oxmt",
      },
    });

    // Define the email options
    const mailOptions = {
      from: "ahmedmoanis@std.mans.edu.eg",
      to: email,
      subject: subject,
      text: text,
    };

    // Send the email
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return false;
      } else {
        return true;
      }
    });
  }

  static requestVlidation(req, method) {
    var userData = req.body;

  
  
    for (const key in userData) {
      const value = userData[key];
     
      if (value.length == 0) {
        return { status: 422, message: "can't be empty", field: key };
      }
      if (key === "email") {
        if (!this.validate(/^[^\s@]+@[^\s@]+\.[^\s@]+$/, value)) {
          return { status: 422, message: "not valid format", field: key };
        }
      }
  
      if (key === "verify_code") {
        if (isNaN(value)) {
          return { status: 422, message: "must be a number", field: key };
        }
  
        if (value.length != 5) {
          return { status: 422, message: "number must be 5 digit", field: key };
        }
      }
  
      if (key === "phone") {
        if (isNaN(value)) {
          return { status: 422, message: "must be a number", field: key };
        }
  
        if (value.length != 11) {
          return { status: 422, message: "number must be 11 digit", field: key };
        }
      }
  
      if (key === "password") {
        // if (isNaN(value)) {
        //   return { status: 422, message: "must be a number", field: key };
        // }
        if (value.length <= 6) {
          return { status: 422, message: "must be more than 6", field: key };
        }
      }
    }
  
    // Return null if no validation errors
    return null;
  }
  static validate = (regexp,value) => {
    return regexp.test(value);
  };
}


module.exports = Helper;
