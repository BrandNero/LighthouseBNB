/* eslint-disable camelcase */
const properties = require("./json/properties.json");
const users = require("./json/users.json");
const { Pool } = require('pg');

const pool = new Pool({
  user: "labber",
  password: "labber",
  host: "localhost",
  database: "lightbnb",
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  const queryString = 'SELECT * FROM users WHERE email = $1';
  return pool
    .query(queryString, [email])
    .then((result) => {
      if (result.rows.length === 0) {
        return null;
      } else {
        return result.rows[0];
      }
    })
    .catch((err) => {
      return Promise.reject(err);
    });
};

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  const queryString = 'SELECT * FROM users WHERE id = $1';
  return pool
    .query(queryString, [id])
    .then((result) => {
      if (result.rows.length === 0) {
        return null;
      } else {
        return result.rows[0];
      }
    })
    .catch((err) => {
      return Promise.reject(err);
    });
};

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function(user) {
  const queryString = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING *;';
  return pool
    .query(queryString, [user.name, user.email, user.password])
    .then((result) => {
      return result.rows[0];
    })
    .catch((err) => {
      return Promise.reject(err);
    });
};

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit) {
  const queryString =  `SELECT reservations.*, properties.*, avg(property_reviews.rating) as average_rating
                        FROM reservations
                        JOIN properties ON reservations.property_id = properties.id
                        JOIN property_reviews ON properties.id = property_reviews.property_id
                        WHERE reservations.guest_id = $1
                        GROUP BY properties.id, reservations.id
                        ORDER BY reservations.start_date
                        LIMIT $2;`;

  return pool
    .query(queryString, [guest_id, limit])
    .then((results) => {
      console.log(results);
      return results.rows;
    })
    .catch((err) => {
      return Promise.reject(err);
    });
};

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit) => {
  const queryString = `SELECT * FROM properties LIMIT $1`;
  return pool
    .query(queryString, [limit = 10])
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      return Promise.reject(err);
    });
};

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};

module.exports = {
  getUserWithEmail,
  getUserWithId,
  addUser,
  getAllReservations,
  getAllProperties,
  addProperty,
};
