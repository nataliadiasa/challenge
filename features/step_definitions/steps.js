import { Given, When, Then, Before } from '@cucumber/cucumber';
import { expect } from "chai"
import querystring from 'querystring';

Before(function () {
    this.endpoint = "";
    this.searchParams = {};
    this.response = null;
    this.responseData = null;
})

Given("I set GET breeds API endpoint", function () {
    this.endpoint = "https://catfact.ninja/breeds"
})

Given(/^I set query param "([\w]+)" to (.*)$/, function (param, value) {
    this.searchParams[param] = value;
})


When(/^I send ([\w]+) http request$/, async function (method) {
    const searchParams = querystring.stringify(this.searchParams);

    const response = await fetch(`${this.endpoint}?${searchParams}`, { method, body: this.payload })
    this.response = response;
    this.responseData = await response.json();
})

Then("I receive HTTP status {int}", function (status) {
    expect(this.response.status).to.eq(status)
})

Then(`I check "current_page" in response body is equal to {int}`, function (pages) {
    expect(this.responseData.current_page).to.eq(pages)
});

Then(`I check "data" in response body has {int} elements`, function (count) {
    expect(this.responseData.data).to.has.length(count)
});