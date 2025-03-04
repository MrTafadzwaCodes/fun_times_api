# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dry-configurable` gem.
# Please instead update this file by running `bin/tapioca gem dry-configurable`.


# source://dry-configurable//lib/dry/configurable/constants.rb#3
module Dry
  class << self
    # source://dry-auto_inject/1.1.0/lib/dry/auto_inject.rb#61
    def AutoInject(container, options = T.unsafe(nil)); end

    # @api public
    #
    # source://dry-configurable//lib/dry/configurable.rb#11
    def Configurable(**options); end

    # source://dry-core/1.1.0/lib/dry/core.rb#52
    def Equalizer(*keys, **options); end
  end
end

# A simple configuration mixin
#
# @api public
# @example class-level configuration
#
#   class App
#   extend Dry::Configurable
#
#   setting :database do
#   setting :dsn, 'sqlite:memory'
#   end
#   end
#
#   App.config.database.dsn = 'jdbc:sqlite:memory'
#   App.config.database.dsn
#   # => "jdbc:sqlite:memory"
# @example instance-level configuration
#
#   class App
#   include Dry::Configurable
#
#   setting :database
#   end
#
#   production = App.new
#   production.config.database = ENV['DATABASE_URL']
#   production.finalize!
#
#   development = App.new
#   development.config.database = 'jdbc:sqlite:memory'
#   development.finalize!
#
# source://dry-configurable//lib/dry/configurable/constants.rb#7
module Dry::Configurable
  include ::Dry::Core::Constants
  extend ::Dry::Core::Deprecations::Interface
  include ::Dry::Configurable::InstanceMethods

  mixes_in_class_methods ::Dry::Configurable::ClassMethods

  # Mixes in test interface into the configurable module
  #
  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/test_interface.rb#20
  def enable_test_interface; end

  class << self
    # @api private
    # @private
    #
    # source://dry-configurable//lib/dry/configurable.rb#64
    def extended(klass); end

    # @api private
    # @private
    #
    # source://dry-configurable//lib/dry/configurable.rb#70
    def included(klass); end

    # @api public
    #
    # source://dry-configurable//lib/dry/configurable.rb#49
    def loader; end
  end
end

# @api public
#
# source://dry-configurable//lib/dry/configurable/errors.rb#14
class Dry::Configurable::AlreadyIncludedError < ::Dry::Configurable::Error; end

# source://dry-configurable//lib/dry/configurable/class_methods.rb#7
module Dry::Configurable::ClassMethods
  include ::Dry::Configurable::Methods

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#72
  def __config_build__(settings = T.unsafe(nil)); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#82
  def __config_dsl__; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#77
  def __config_extension__; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#90
  def __config_reader__; end

  # Return configuration
  #
  # @api public
  # @return [Config]
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#67
  def config; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#11
  def inherited(subclass); end

  # Add a setting to the configuration
  #
  # @api public
  # @param name [Mixed] The accessor key for the configuration value
  # @param default [Mixed] Default value for the setting
  # @param constructor [#call] Transformation given value will go through
  # @param reader [Boolean] Whether a reader accessor must be created
  # @return [Dry::Configurable::Config]
  # @yield A block can be given to add nested settings.
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#43
  def setting(*_arg0, **_arg1, &_arg2); end

  # Returns the defined settings for the class.
  #
  # @api public
  # @return [Settings]
  #
  # source://dry-configurable//lib/dry/configurable/class_methods.rb#58
  def settings; end
end

# Setting compiler used internally by the DSL
#
# @api private
#
# source://dry-configurable//lib/dry/configurable/compiler.rb#8
class Dry::Configurable::Compiler
  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/compiler.rb#9
  def call(ast); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/compiler.rb#18
  def visit(node); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/compiler.rb#30
  def visit_nested(node); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/compiler.rb#24
  def visit_setting(node); end
end

# Config exposes setting values through a convenient API
#
# @api public
#
# source://dry-configurable//lib/dry/configurable/config.rb#10
class Dry::Configurable::Config
  include ::Dry::Core::Equalizer::Methods

  # @api private
  # @return [Config] a new instance of Config
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#24
  def initialize(settings, values: T.unsafe(nil)); end

  # Get config value by a key
  #
  # @api public
  # @param name [String, Symbol]
  # @return Config value
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#47
  def [](name); end

  # Set config value.
  # Note that finalized configs cannot be changed.
  #
  # @api public
  # @param name [String, Symbol]
  # @param value [Object]
  # @raise [FrozenConfigError]
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#69
  def []=(name, value); end

  # @api private
  #
  # source://dry-core/1.1.0/lib/dry/core/equalizer.rb#87
  def _dry_equalizer_hash; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#14
  def _settings; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#17
  def _values; end

  # Returns true if the value for the given key has been set on this config.
  #
  # For simple values, this returns true if the value has been explicitly assigned.
  #
  # For cloneable (mutable) values, since these are captured on read, returns true if the value
  # does not compare equally to its corresdponing default value. This relies on these objects
  # having functioning `#==` checks.
  #
  # @api public
  # @return [Bool]
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#116
  def configured?(key); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#38
  def dup_for_settings(settings); end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#159
  def finalize!(freeze_values: T.unsafe(nil)); end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#152
  def hash; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#181
  def pristine; end

  # Returns config values as a hash, with nested values also converted from {Config} instances
  # into hashes.
  #
  # @api public
  # @return [Hash]
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#144
  def to_h; end

  # Update config with new values
  #
  # @api public
  # @param values [Hash, #to_hash] A hash with new values
  # @return [Config]
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#90
  def update(values); end

  # Returns the current config values.
  #
  # Nested configs remain in their {Config} instances.
  #
  # @api public
  # @return [Hash]
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#131
  def values; end

  protected

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#20
  def _configured; end

  private

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#208
  def dup_values; end

  # @api private
  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#31
  def initialize_copy(source); end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#187
  def method_missing(name, *args); end

  # @api public
  # @return [Boolean]
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#200
  def respond_to_missing?(meth, include_private = T.unsafe(nil)); end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/config.rb#204
  def setting_name_from_method(method_name); end
end

# Setting DSL used by the class API
#
# @api private
#
# source://dry-configurable//lib/dry/configurable/dsl.rb#8
class Dry::Configurable::DSL
  # @api private
  # @return [DSL] a new instance of DSL
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#17
  def initialize(**options, &block); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#13
  def ast; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#11
  def compiler; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#49
  def config_class; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#53
  def default; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#15
  def options; end

  # Registers a new setting node and compile it into a setting object
  #
  # @api private
  # @return Setting
  # @see ClassMethods.setting
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#29
  def setting(name, **options, &block); end

  private

  # @api private
  # @raise [ArgumentError]
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#59
  def ensure_valid_options(options); end

  # Returns a tuple of valid and invalid options hashes derived from the options hash
  # given to the setting
  #
  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/dsl.rb#69
  def valid_and_invalid_options(options); end
end

# @api private
#
# source://dry-configurable//lib/dry/configurable/dsl.rb#9
Dry::Configurable::DSL::VALID_NAME = T.let(T.unsafe(nil), Regexp)

# @api public
#
# source://dry-configurable//lib/dry/configurable/errors.rb#10
class Dry::Configurable::Error < ::StandardError; end

# @api public
#
# source://dry-configurable//lib/dry/configurable/extension.rb#5
class Dry::Configurable::Extension < ::Module
  # @api private
  # @return [Extension] a new instance of Extension
  #
  # source://dry-configurable//lib/dry/configurable/extension.rb#13
  def initialize(config_class: T.unsafe(nil), default_undefined: T.unsafe(nil)); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/extension.rb#7
  def config_class; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/extension.rb#10
  def default_undefined; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/extension.rb#21
  def extended(klass); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/extension.rb#28
  def included(klass); end
end

# @api public
#
# source://dry-configurable//lib/dry/configurable/errors.rb#12
class Dry::Configurable::FrozenConfigError < ::Dry::Configurable::Error; end

# Initializer method which is prepended when `Dry::Configurable`
# is included in a class
#
# @api private
#
# source://dry-configurable//lib/dry/configurable/instance_methods.rb#12
module Dry::Configurable::Initializer
  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/instance_methods.rb#14
  def initialize(*_arg0, **_arg1); end
end

# Instance-level API when `Dry::Configurable` is included in a class
#
# @api public
#
# source://dry-configurable//lib/dry/configurable/instance_methods.rb#25
module Dry::Configurable::InstanceMethods
  include ::Dry::Configurable::Methods

  # Return object's configuration
  #
  # @api public
  # @return [Config]
  #
  # source://dry-configurable//lib/dry/configurable/instance_methods.rb#33
  def config; end

  # Finalize the config and freeze the object
  #
  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/instance_methods.rb#40
  def finalize!(freeze_values: T.unsafe(nil)); end

  private

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/instance_methods.rb#48
  def initialize_copy(source); end
end

# Common API for both classes and instances
#
# @api public
#
# source://dry-configurable//lib/dry/configurable/methods.rb#8
module Dry::Configurable::Methods
  # @api public
  # @raise [FrozenConfigError]
  # @yield [config]
  #
  # source://dry-configurable//lib/dry/configurable/methods.rb#10
  def configure(&block); end

  # Finalize and freeze configuration
  #
  # @api public
  # @return [Dry::Configurable::Config]
  #
  # source://dry-configurable//lib/dry/configurable/methods.rb#22
  def finalize!(freeze_values: T.unsafe(nil)); end
end

# A defined setting.
#
# @api public
#
# source://dry-configurable//lib/dry/configurable/setting.rb#10
class Dry::Configurable::Setting
  include ::Dry::Core::Equalizer::Methods

  # @api private
  # @return [Setting] a new instance of Setting
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#43
  def initialize(name, default:, constructor: T.unsafe(nil), children: T.unsafe(nil), **options); end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#32
  def children; end

  # @api public
  # @return [Boolean]
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#67
  def cloneable?; end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#29
  def constructor; end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#23
  def default; end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#26
  def mutable; end

  # @api public
  # @return [Boolean]
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#67
  def mutable?; end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#20
  def name; end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#35
  def options; end

  # @api private
  # @return [Boolean]
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#62
  def reader?; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/setting.rb#73
  def to_value; end

  class << self
    # @api private
    # @return [Boolean]
    #
    # source://dry-configurable//lib/dry/configurable/setting.rb#38
    def mutable_value?(value); end
  end
end

# @api public
#
# source://dry-configurable//lib/dry/configurable/setting.rb#15
Dry::Configurable::Setting::DEFAULT_CONSTRUCTOR = T.let(T.unsafe(nil), Proc)

# @api public
#
# source://dry-configurable//lib/dry/configurable/setting.rb#17
Dry::Configurable::Setting::MUTABLE_VALUE_TYPES = T.let(T.unsafe(nil), Array)

# @api public
#
# source://dry-configurable//lib/dry/configurable/setting.rb#13
Dry::Configurable::Setting::OPTIONS = T.let(T.unsafe(nil), Array)

# A collection of defined settings on a given class.
#
# @api private
#
# source://dry-configurable//lib/dry/configurable/settings.rb#8
class Dry::Configurable::Settings
  include ::Dry::Core::Equalizer::Methods
  include ::Enumerable

  # @api private
  # @return [Settings] a new instance of Settings
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#17
  def initialize(settings = T.unsafe(nil)); end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#27
  def <<(setting); end

  # Returns the setting for the given name, if found.
  #
  # @api public
  # @return [Setting, nil] the setting, or nil if not found
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#37
  def [](name); end

  # @api public
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#60
  def each(&_arg0); end

  # Returns true if a setting for the given name is defined.
  #
  # @api public
  # @return [Boolean]
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#46
  def key?(name); end

  # Returns the list of defined setting names.
  #
  # @api public
  # @return [Array<Symbol>]
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#55
  def keys; end

  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#14
  def settings; end

  private

  # @api private
  # @api private
  #
  # source://dry-configurable//lib/dry/configurable/settings.rb#22
  def initialize_copy(source); end
end

# Methods meant to be used in a testing scenario
#
# @api public
#
# source://dry-configurable//lib/dry/configurable/test_interface.rb#6
module Dry::Configurable::TestInterface
  # Resets configuration to default values
  #
  # @api public
  # @return [Dry::Configurable::Config]
  #
  # source://dry-configurable//lib/dry/configurable/test_interface.rb#12
  def reset_config; end
end
