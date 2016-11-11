#!/usr/bin/env node

'strict mode';

const exec = require('child_process').exec;
const moment = require('moment');

const calendar = function() {
    return  {
        full_text: moment().format('ddd, DD of MMM')
    };
};

const clock = function() {
    return {
        full_text: moment().format('hh:mm:ss A')
    };
};

console.log("{\"version\": 1}");

// Begin infinite array.
console.log("[");

(function main() {
    console.log(JSON.stringify([calendar(), clock()]) + ",");
    setTimeout(main, 1000);
})();
