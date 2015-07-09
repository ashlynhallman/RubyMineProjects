class Authenticator

  def initialize

    @known_users = {
        "rdhallman" => { password: 'v47hn2xi', :user_type => :site_admin },
        "ashlyn" => { password: 'v47hn2xi', :user_type => :site_admin},
        "joe" => { password: "smo", :user_type => :site_reader },
        "matt" => { password: "blahblah", :user_type => :site_writer},
        "bree" => { password: "bark", :user_type => :site_editor},
        "stacey" => { password: "mom", :user_type => :site_writer}
    }
  end

  def login
     puts "Username: "
     username = gets().chomp
     puts "Password: "
     password_entry = gets().chomp

    puts "Authenticating user #{username}"

    if @known_users.has_key?(username)
      profile = @known_users[username]

      if password_entry == profile[:password]
        puts "Welcome #{username}! You are a #{profile[:user_type]}."

        case profile[:user_type]
          when :site_admin;
            require_relative 'site_admin'
            @current_user = SiteAdmin.new(profile)
            puts "user == #{@current_user.inspect}"
          when :site_reader;
            require_relative 'site_reader'
            @current_user = SiteReader.new(profile)
            puts "user == #{@current_user.inspect}"
          when :site_editor;
            require_relative 'site_editor'
            @current_user = SiteEditor.new(profile)
            puts "user == #{@current_user.inspect}"
          when :site_writer;
            require_relative 'site_writer'
            @current_user = SiteWriter.new(profile)
            puts "user == #{@current_user.inspect}"
          else
            puts "Invalid user type"
        end

      else
        puts "Invalid login."
      end
    else
      puts "Invalid login."
    end
  end

end


auth = Authenticator.new
auth.login