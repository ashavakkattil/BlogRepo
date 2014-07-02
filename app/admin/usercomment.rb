ActiveAdmin.register Usercomment do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  

#    actions :all, except: [:edit,:new]

  



   controller do
    def permitted_params
      params.permit usercomment: [:commenter,:body,:post_id]
    end

  end
  
  filter :post, :collection => proc {(Post.all).map{|c| [c.title, c.id]}}
end
