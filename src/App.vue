<template>
  <div id="app">
    <img src="./assets/logo.png">
    <survey :survey="survey" /> 
    <!-- Uncomment the line below to display survey editor -->
     <!-- <survey-editor /> 
  </div>
</template>

<script>
import Vue from "vue";
import SurveyEditor from "./components/SurveyEditor";
import * as SurveyVue from "survey-vue";
import axios from "axios";
import VueAxios from "vue-axios";
import "bootstrap/dist/css/bootstrap.css";

Vue.use(VueAxios, axios);

var Survey = SurveyVue.Survey;
Survey.cssType = "bootstrap";

import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "app",
  components: {
    Survey,
    SurveyEditor,
    HelloWorld
  },
  data() {
    var json = { title: "Waiting for project info.." };
    var model = new SurveyVue.Model(json);
    return {
      survey: model
    };
  },
  // Add event hooks: https://vuejs.org/v2/guide/instance.html#Lifecycle-Diagram
  // See: https://vuejs.org/v2/api/#mounted
  mounted() {
    // Get specified survey template from external API
    Vue.axios.get("https://localhost:4001/api/surveys/3").then(
      /*     Vue.axios
      .get("https://sharingcities.evothings.com/survey_api/surveys/2")
      .then( */
      result => {
        var survey_id = result.data.data.survey_id;
        var template = result.data.data.survey_design;
        var new_model = new SurveyVue.Model(template);
        // Add model handler to save completed survey
        new_model.onComplete.add(function(result) {
          var answers = JSON.stringify(result.data);
          var pseudonym = "anonymous";
          if (result.data.want_followup) {
            pseudonym = result.pseudonym;
          }
          // eslint-disable-next-line
          console.log("Saved survey results: " + answers);
          var input = {
            answer: {
              survey_id: survey_id,
              survey_answers: result.data,
              pseudonym: pseudonym,
              user_id: 0 // TODO: add real user data here
            }
          };
          axios.post("https://localhost:4001/api/answers", input).then(
            /*             axios
              .post(
                "https://sharingcities.evothings.com/survey_api/answers",
                input
              )
              .then( */
            // eslint-disable-next-line
            result => {
              this.response = answers;
            },
            error => {
              // eslint-disable-next-line
              console.error(error);
            }
          );
        });
        // Update empty survey with model loaded from API
        Vue.set(this, "survey", new_model);
      },
      error => {
        // eslint-disable-next-line
        console.error(error);
      }
    );
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
</style>
