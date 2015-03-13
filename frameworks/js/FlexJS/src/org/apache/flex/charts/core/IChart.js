/**
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * org_apache_flex_charts_core_IChart
 *
 * @fileoverview
 *
 * @suppress {checkTypes}
 */

goog.provide('org_apache_flex_charts_core_IChart');



/**
 * @interface
 */
org_apache_flex_charts_core_IChart = function() {
};


Object.defineProperties(org_apache_flex_charts_core_IChart.prototype, {
    'series': {
        get: function() {},
        set: function(value) {}
    }
});


/**
 * Metadata
 *
 * @type {Object.<string, Array.<Object>>}
 */
org_apache_flex_charts_core_IChart.prototype.FLEXJS_CLASS_INFO = {
    names: [{ name: 'IChart', qName: 'org_apache_flex_charts_core_IChart'}]
  };
