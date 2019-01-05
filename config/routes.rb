Rails.application.routes.draw do
  scope 'payments' do
    post 'result',  to: 'payments#result' # to handle Robokassa push request
    get  'success', to: 'payments#success' # to handle Robokassa success redirect
    get  'failed',  to: 'payments#failed' # to handle Robokassa fail redirect
  end
end