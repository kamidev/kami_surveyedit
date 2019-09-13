// For authoring Nightwatch tests, see
// http://nightwatchjs.org/guide#usage

module.exports = {
  'default e2e tests': browser => {
    browser
      .url(process.env.VUE_DEV_SERVER_URL)
      .waitForElementVisible('#app', 8080)
      .assert.elementPresent('#surveyEditorContainer')
      /*       .assert.containsText("h1", "Welcome to Your Vue.js App")
      .assert.elementCount("img", 1) */
      .end()
  }
}
