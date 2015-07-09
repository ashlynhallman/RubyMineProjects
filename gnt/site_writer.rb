require_relative 'site_user'

class SiteWriter < SiteUser

  def write_article
    # This function exists only on Site Editors
    # because they have authority to author new
    # content.
  end
end
