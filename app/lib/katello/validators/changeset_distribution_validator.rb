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

module Katello
  module Validators
    class ChangesetDistributionValidator < ActiveModel::Validator
      def validate(record)
        if record.repositories.empty?
          if record.errors[:base] << _("Distribution '%s' does not belong to the specified product!") % record.distribution_id
            return
          end
        end
        if record.promotable_repositories.empty?
          record.errors[:base] << _("Repository of the distribution '%s' has not been promoted into the target environment!") %
              record.distribution_id
        end
      end
    end
  end
end
