class AuthorsController < ApplicationController
    def new
    end
    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to root_path, notice: "Author created successfully."
        else
            render 'new'
        end
    end
    private
        def author_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
        end
end
