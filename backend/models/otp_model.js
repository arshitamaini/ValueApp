const mongoose = require('mongoose')
const Schema = mongoose.Schema
 
var OtpSchema = Schema(
  {
    userId: {
      type: String,
      required: true
    },
    otp: {
      type: String,
      required: true
    },
    createdAt: {
      type: Date,
      default: Date.now,
      index: { expires: 300 }
    }
  },
  { timestamps: true } // Auto remove after 5 minutes
);
 
var OtpSchema = mongoose.model('otps', OtpSchema, 'otps'); 
module.exports = OtpSchema; 