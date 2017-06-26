require "packaging/platforms"

# These are all of the parameters known to our packaging system.
# They are ingested by the config class as class instance variables
module Pkg::Params
  BUILD_PARAMS = [:allow_dirty_tree,
                  :answer_override,
                  :apt_host,
                  :apt_releases,
                  :apt_repo_command,
                  :apt_repo_name,
                  :apt_repo_path,
                  :apt_repo_staging_path,
                  :apt_repo_url,
                  :apt_signing_server,
                  :apt_staging_server,
                  :author,
                  :benchmark,
                  :build_date,
                  :build_defaults,
                  :build_dmg,
                  :build_doc,
                  :build_gem,
                  :build_ips,
                  :build_msi,
                  :build_pe,
                  :build_tar,
                  :builder_data_file,
                  :builds_server,
                  :bundle_platforms,
                  :certificate_pem,
                  :cows,
                  :db_table,
                  :deb_build_host,
                  :deb_build_mirrors,
                  :deb_targets,
                  :debug,
                  :debversion,
                  :default_cow,
                  :default_mock,
                  :dev_build,
                  :description,
                  :distribution_server,
                  :dmg_host,
                  :dmg_path,
                  :dmg_staging_server,
                  :email,
                  :files,
                  :final_mocks,
                  :foss_only,
                  :foss_platforms,
                  :freight_conf,
                  :gem_default_executables,
                  :gem_dependencies,
                  :gem_description,
                  :gem_devel_dependencies,
                  :gem_development_dependencies,
                  :gem_excludes,
                  :gem_executables,
                  :gem_files,
                  :gem_forge_project,
                  :gem_host,
                  :gem_name,
                  :gem_path,
                  :gem_platform_dependencies,
                  :gem_rdoc_options,
                  :gem_require_path,
                  :gem_required_ruby_version,
                  :gem_required_rubygems_version,
                  :gem_runtime_dependencies,
                  :gem_summary,
                  :gem_test_files,
                  :gemversion,
                  :gpg_key,
                  :gpg_name,
                  :gpg_nonfinal_key,
                  :homepage,
                  :internal_gem_host,
                  :internal_nexus_host,
                  :internal_stickler_host,
                  :ips_build_host,
                  :ips_host,
                  :ips_inter_cert,
                  :ips_package_host,
                  :ips_path,
                  :ips_repo,
                  :ips_root_cert,
                  :ips_signing_cert,
                  :ips_signing_key,
                  :ips_signing_server,
                  :ips_signing_ssh_key,
                  :ips_store,
                  :jenkins_build_host,
                  :jenkins_packaging_job,
                  :jenkins_repo_path,
                  :metrics,
                  :metrics_url,
                  :msi_host,
                  :msi_name,
                  :msi_path,
                  :msi_signing_cert,
                  :msi_signing_cert_pw,
                  :msi_signing_server,
                  :msi_signing_ssh_key,
                  :msi_staging_server,
                  :name,
                  :nonfinal_repo_name,
                  :nonfinal_repo_link_target,
                  :notify,
                  :nuget_host,
                  :nuget_repo_path,
                  :origversion,
                  :osx_build_host,
                  :osx_signing_cert,
                  :osx_signing_keychain,
                  :osx_signing_keychain_pw,
                  :osx_signing_server,
                  :osx_signing_ssh_key,
                  :p5p_host,
                  :p5p_path,
                  :packager,
                  :packaging_repo,
                  :packaging_root,
                  :packaging_url,
                  :pbuild_conf,
                  :pe_feature_branch,
                  :pe_name,
                  :pe_platforms,
                  :pe_version,
                  :pg_major_version,
                  :platform_repos,
                  :pre_tar_task,
                  :pre_tasks,
                  :privatekey_pem,
                  :project,
                  :project_root,
                  :random_mockroot,
                  :rc_mocks,
                  :redis_hostname,
                  :ref,
                  :release,
                  :repo_link_target,
                  :repo_name,
                  :rpm_build_host,
                  :rpm_targets,
                  :rpmrelease,
                  :rpmversion,
                  :short_ref,
                  :sign_tar,
                  :signing_server,
                  :staging_server,
                  :summary,
                  :svr4_host,
                  :svr4_path,
                  :swix_host,
                  :swix_path,
                  :swix_staging_server,
                  :tar_excludes,
                  :tar_host,
                  :tar_staging_server,
                  :tarball_path,
                  :task,
                  :team,
                  :templates,
                  :update_version_file,
                  :vanagon_project,
                  :version,
                  :version_file,
                  :version_strategy,
                  :yum_host,
                  :yum_repo_command,
                  :yum_repo_name,
                  :yum_repo_path,
                  :yum_staging_server,
                 ]

  # Environment variable overrides for Pkg::Config parameters
  #
  #           :var  => :config_param,    :envvar => :environment var :type => :variable type
  #
  #           Note: :type is assumed :string if not present
  #
  ENV_VARS = [
              { :var => :allow_dirty_tree,        :envvar => :ALLOW_DIRTY_TREE, :type => :bool },
              { :var => :answer_override,         :envvar => :ANSWER_OVERRIDE },
              { :var => :apt_host,                :envvar => :APT_HOST },
              { :var => :apt_releases,            :envvar => :APT_RELEASES,    :type => :array },
              { :var => :apt_repo_path,           :envvar => :APT_REPO },
              { :var => :apt_repo_staging_path,   :envvar => :APT_REPO_STAGING_PATH },
              { :var => :apt_signing_server,      :envvar => :APT_SIGNING_SERVER },
              { :var => :apt_staging_server,      :envvar => :APT_STAGING_SERVER },
              { :var => :build_dmg,               :envvar => :DMG,             :type => :bool },
              { :var => :build_doc,               :envvar => :DOC,             :type => :bool },
              { :var => :build_gem,               :envvar => :GEM,             :type => :bool },
              { :var => :build_ips,               :envvar => :IPS,             :type => :bool },
              { :var => :build_msi,               :envvar => :MSI,             :type => :bool },
              { :var => :build_pe,                :envvar => :PE_BUILD,        :type => :bool },
              { :var => :build_tar,               :envvar => :TAR,             :type => :bool },
              { :var => :certificate_pem,         :envvar => :CERT_PEM },
              { :var => :cows,                    :envvar => :COW },
              { :var => :debug,                   :envvar => :DEBUG,           :type => :bool },
              { :var => :default_cow,             :envvar => :COW },
              { :var => :default_mock,            :envvar => :MOCK },
              { :var => :dev_build,               :envvar => :DEV_BUILD,       :type => :bool },
              { :var => :dmg_host,                :envvar => :DMG_HOST },
              { :var => :dmg_path,                :envvar => :DMG_PATH },
              { :var => :dmg_staging_server,      :envvar => :DMG_STAGING_SERVER },
              { :var => :final_mocks,             :envvar => :MOCK },
              { :var => :foss_only,               :envvar => :FOSS_ONLY,       :type => :bool },
              { :var => :foss_platforms,          :envvar => :FOSS_PLATFORMS,  :type => :array },
              { :var => :gem_host,                :envvar => :GEM_HOST },
              { :var => :gpg_key,                 :envvar => :GPG_KEY },
              { :var => :gpg_name,                :envvar => :GPG_NAME },
              { :var => :gpg_nonfinal_key,        :envvar => :GPG_NONFINAL_KEY },
              { :var => :ips_host,                :envvar => :IPS_HOST },
              { :var => :ips_inter_cert,          :envvar => :IPS_INTER_CERT },
              { :var => :ips_path,                :envvar => :IPS_PATH },
              { :var => :ips_repo,                :envvar => :IPS_REPO },
              { :var => :ips_root_cert,           :envvar => :IPS_ROOT_CERT },
              { :var => :ips_signing_cert,        :envvar => :IPS_SIGNING_CERT },
              { :var => :ips_signing_key,         :envvar => :IPS_SIGNING_KEY },
              { :var => :ips_signing_server,      :envvar => :IPS_SIGNING_SERVER },
              { :var => :ips_signing_ssh_key,     :envvar => :IPS_SIGNING_SSH_KEY },
              { :var => :msi_host,                :envvar => :MSI_HOST },
              { :var => :msi_path,                :envvar => :MSI_PATH },
              { :var => :msi_signing_cert,        :envvar => :MSI_SIGNING_CERT },
              { :var => :msi_signing_cert_pw,     :envvar => :MSI_SIGNING_CERT_PW },
              { :var => :msi_signing_server,      :envvar => :MSI_SIGNING_SERVER },
              { :var => :msi_signing_ssh_key,     :envvar => :MSI_SIGNING_SSH_KEY },
              { :var => :msi_staging_server,      :envvar => :MSI_STAGING_SERVER },
              { :var => :nonfinal_repo_link_target, :envvar => :NONFINAL_REPO_LINK_TARGET },
              { :var => :nonfinal_repo_name,      :envvar => :NONFINAL_REPO_NAME },
              { :var => :notify,                  :envvar => :NOTIFY },
              { :var => :nuget_host,              :envvar => :NUGET_HOST },
              { :var => :nuget_repo_path,         :envvar => :NUGET_REPO },
              { :var => :osx_signing_cert,        :envvar => :OSX_SIGNING_CERT },
              { :var => :osx_signing_keychain,    :envvar => :OSX_SIGNING_KEYCHAIN },
              { :var => :osx_signing_keychain_pw, :envvar => :OSX_SIGNING_KEYCHAIN_PW },
              { :var => :osx_signing_server,      :envvar => :OSX_SIGNING_SERVER },
              { :var => :osx_signing_ssh_key,     :envvar => :OSX_SIGNING_SSH_KEY },
              { :var => :p5p_host,                :envvar => :P5P_HOST },
              { :var => :p5p_path,                :envvar => :P5P_PATH },
              { :var => :packager,                :envvar => :PACKAGER },
              { :var => :pbuild_conf,             :envvar => :PBUILDCONF },
              { :var => :pe_feature_branch,       :envvar => :PE_FEATURE_BRANCH },
              { :var => :pe_version,              :envvar => :PE_VER },
              { :var => :privatekey_pem,          :envvar => :PRIVATE_PEM },
              { :var => :project_root,            :envvar => :PROJECT_ROOT },
              { :var => :random_mockroot,         :envvar => :RANDOM_MOCKROOT, :type => :bool },
              { :var => :rc_mocks,                :envvar => :MOCK },
              { :var => :release,                 :envvar => :RELEASE },
              { :var => :repo_name,               :envvar => :REPO_NAME },
              { :var => :repo_link_target,        :envvar => :REPO_LINK_TARGET },
              { :var => :sign_tar,                :envvar => :SIGN_TAR,        :type => :bool },
              { :var => :signing_server,          :envvar => :SIGNING_SERVER },
              { :var => :staging_server,          :envvar => :STAGING_SERVER },
              { :var => :swix_host,               :envvar => :SWIX_HOST },
              { :var => :swix_staging_server,     :envvar => :SWIX_STAGING_SERVER },
              { :var => :svr4_host,               :envvar => :SVR4_HOST },
              { :var => :svr4_path,               :envvar => :SVR4_PATH },
              { :var => :swix_path,               :envvar => :SWIX_PATH },
              { :var => :tar_host,                :envvar => :TAR_HOST },
              { :var => :tar_staging_server,      :envvar => :TAR_STAGING_SERVER },
              { :var => :team,                    :envvar => :TEAM },
              { :var => :update_version_file,     :envvar => :NEW_STYLE_PACKAGE },
              { :var => :vanagon_project,         :envvar => :VANAGON_PROJECT, :type => :bool },
              { :var => :yum_host,                :envvar => :YUM_HOST },
              { :var => :yum_repo_path,           :envvar => :YUM_REPO },
              { :var => :yum_staging_server,      :envvar => :YUM_STAGING_SERVER },
              { :var => :internal_gem_host,       :envvar => :INTERNAL_GEM_HOST },
              { :var => :internal_nexus_host,     :envvar => :INTERNAL_NEXUS_HOST },
              { :var => :internal_stickler_host,  :envvar => :INTERNAL_STICKLER_HOST },
             ]
  # Default values that are supplied if the user does not supply them
  #
  # usage is the same as above
  #
  DEFAULTS = [{ :var => :allow_dirty_tree,        :val => false },
              { :var => :builder_data_file,       :val => 'builder_data.yaml' },
              { :var => :team,                    :val => 'dev' },
              { :var => :random_mockroot,         :val => true },
              { :var => :keychain_loaded,         :val => false },
              { :var => :foss_only,               :val => false },
              { :var => :build_date,              :val => Pkg::Util::Date.timestamp('-') },
              { :var => :release,                 :val => '1' },
              { :var => :internal_gem_host,       :val => 'http://rubygems.delivery.puppetlabs.net/' },
              { :var => :build_tar,               :val => true },
              { :var => :dev_build,               :val => false },
              { :var => :osx_signing_cert,        :val => '$OSX_SIGNING_CERT' },
              { :var => :osx_signing_keychain,    :val => '$OSX_SIGNING_KEYCHAIN' },
              { :var => :osx_signing_keychain_pw, :val => '$OSX_SIGNING_KEYCHAIN_PW' },
              { :var => :ips_signing_cert,        :val => '$IPS_SIGNING_CERT' },
              { :var => :ips_inter_cert,          :val => '$IPS_INTER_CERT' },
              { :var => :ips_root_cert,           :val => '$IPS_ROOT_CERT' },
              { :var => :ips_signing_key,         :val => '$IPS_SIGNING_KEY' },
              { :var => :msi_signing_cert,        :val => '$MSI_SIGNING_CERT' },
              { :var => :msi_signing_cert_pw,     :val => '$MSI_SIGNING_CERT_PW' },
              { :var => :pe_feature_branch,       :val => false },
              { :var => :apt_releases,            :val => Pkg::Platforms.codenames("deb") }]

  # These are variables which, over time, we decided to rename or replace. For
  # backwards compatibility, we assign the value of the old/deprecated
  # variables, if set, to the new ones. We also use this method for accessor
  # "redirects" - e.g. defaulting the populated value of one parameter for another
  # in case it is not set.
  #
  REASSIGNMENTS = [
                    { :oldvar => :internal_gem_host,      :newvar => :internal_nexus_host },
                    { :oldvar => :internal_gem_host,      :newvar => :internal_stickler_host },
                    # These are fall-through values for shipping endpoints
                    { :oldvar => :staging_server,         :newvar => :apt_staging_server },
                    { :oldvar => :staging_server,         :newvar => :dmg_staging_server },
                    { :oldvar => :staging_server,         :newvar => :swix_staging_server },
                    { :oldvar => :staging_server,         :newvar => :tar_staging_server },
                    { :oldvar => :staging_server,         :newvar => :yum_staging_server },
                    # These are fall-through values for signing/repo endpoints
                    { :oldvar => :yum_staging_server,     :newvar => :yum_host },
                    { :oldvar => :apt_repo_staging_path,  :newvar => :apt_repo_path },
                    { :oldvar => :apt_signing_server,     :newvar => :apt_host },
                    # These are legitimately old values
                    { :oldvar => :gem_devel_dependencies, :newvar => :gem_development_dependencies },
                    { :oldvar => :gpg_name,               :newvar => :gpg_key },
                    { :oldvar => :name,                   :newvar => :project },
                    { :oldvar => :pe_name,                :newvar => :project },
                    { :oldvar => :project,                :newvar => :gem_name },
                    { :oldvar => :yum_host,               :newvar => :swix_host },
                    { :oldvar => :yum_host,               :newvar => :dmg_host },
                    { :oldvar => :yum_host,               :newvar => :tar_host },
                    { :oldvar => :apt_repo_name,          :newvar => :repo_name },
                    { :oldvar => :yum_repo_name,          :newvar => :repo_name },
                 ]

  # These are variables that we have deprecated. If they are encountered in a
  # project's config, we issue deprecations for them.
  #
  DEPRECATIONS = [{ :var => :gem_devel_dependencies, :message => "
    DEPRECATED, 9-Nov-2013: 'gem_devel_dependencies' has been replaced with
    'gem_development_dependencies.' Please update this field in your
    build_defaults.yaml or project_data.yaml" },
                  { :var => :gpg_name, :message => "
    DEPRECATED, 29-Jul-2014: 'gpg_name' has been replaced with 'gpg_key'.
                   Please update this field in your build_defaults.yaml" },
                  { :var => :apt_repo_name, :message => "
    DEPRECATED, 25-May-2017: 'apt_repo_name' has been replaced with 'repo_name'.
                   Please update this field in your builds_defaults.yaml" },
                  { :var => :yum_repo_name, :message => "
    DEPRECATED, 25-May-2017: 'yum_repo_name' has been replaced with 'repo_name'.
                   Please update this field in your builds_defaults.yaml" }]
end
