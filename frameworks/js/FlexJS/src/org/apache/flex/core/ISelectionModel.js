/**
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * org_apache_flex_core_ISelectionModel
 *
 * @fileoverview
 *
 * @suppress {checkTypes}
 */

goog.provide('org_apache_flex_core_ISelectionModel');

goog.require('org_apache_flex_core_IBeadModel');



/**
 * @interface
 * @extends {org_apache_flex_events_IEventDispatcher}
 * @extends {org_apache_flex_core_IBeadModel}
 */
org_apache_flex_core_ISelectionModel = function() {
};


Object.defineProperties(org_apache_flex_core_ISelectionModel.prototype, {
    'dataProvider': {
        set: function(value) {},
        get: function() {}
    },
    'selectedIndex': {
        set: function(value) {},
        get: function() {}
    },
    'selectedItem': {
        set: function(value) {},
        get: function() {}
    }
});


/**
 * Metadata
 *
 * @type {Object.<string, Array.<Object>>}
 */
org_apache_flex_core_ISelectionModel.prototype.FLEXJS_CLASS_INFO =
{ names: [{ name: 'ISelectionModel', qName: 'org_apache_flex_core_ISelectionModel'}],
  interfaces: [org_apache_flex_events_IEventDispatcher, org_apache_flex_core_IBeadModel] };
