// authMiddleware.js
const express = require('express');
const session = require('express-session');

const router = express.Router();
// Middleware de autenticação
const isAuthenticated = (req, res, next) => {
    if (req.session && req.session.empresaId) {
        return next();
    }

    return res.status(401).redirect('/login');
};

module.exports = isAuthenticated;
