class Talents::TalentController < ApplicationController
    def show
        @talent = Talent.find(params[:id])
    end

    def edit
        @talent = Talent.find(params[:id]) 
    end

    def update
        talent = Talent.find(params[:id])
        if talent.update(talent_params)
            redirect_to talents_talent_path(talent.id)
        else
            render :edit
        end
    end

    private
    def talent_params
            params.require(:talent).permit(:email, :name, :image)
    end
end
