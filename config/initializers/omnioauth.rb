Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CbTiw0oQCNMivsZL02ankxGMk', 'iglETHmvrAt3dMyaTdug2SwYKixpGNI5OYqXYu6BRDcnoASoYu'
  provider :facebook, '585174424950109', '8ccaf252f6621d23e8043a95a7280645'
end