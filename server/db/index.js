const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  host:"localhost",
  database:"yelp",
  port:5432,
  password:'@.',
});
module.exports = {
  query: (text, params) => pool.query(text, params),
};