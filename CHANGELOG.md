# toml CHANGELOG

This file is used to list changes made in each version of the toml cookbook.

# 0.1.0
Initial release.

# 0.1.1
- Removed extraneous recipe directory
- Cookstyle cleanups

# 0.2.0
- updated custom resource to account for [breaking Custom Resource change in Chef 16.2](https://discourse.chef.io/t/chef-infra-client-16-2-released/17284)

# 0.3.0
- removed TomlRB dependency
- refactored to use Habitat cookbook's TOML support
- fixed sorting and covered dotted strings and => hashes
