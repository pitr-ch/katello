# encoding: utf-8
#
# Copyright 2013 Red Hat, Inc.
#
# This software is licensed to you under the GNU General Public
# License as published by the Free Software Foundation; either version
# 2 of the License (GPLv2) or (at your option) any later version.
# There is NO WARRANTY for this software, express or implied,
# including the implied warranties of MERCHANTABILITY,
# NON-INFRINGEMENT, or FITNESS FOR A PARTICULAR PURPOSE. You should
# have received a copy of GPLv2 along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.

require 'minitest_helper'

class OrganizationDestroyerTest < MiniTest::Rails::ActiveSupport::TestCase

  fixtures :all

  def self.before_suite
    services  = ['Candlepin', 'Pulp', 'ElasticSearch']
    models    = ['Organization', 'KTEnvironment', 'ContentView',
                 'ContentViewEnvironment']
    disable_glue_layers(services, models, true)
  end

  def test_non_async_destroy
    org = FactoryGirl.create(:organization)
    User.current = User.hidden.first
    OrganizationDestroyer.destroy(org, :async => false)
    refute Organization.exists?(org.id)
  end
end
