Puppet::Type.newtype(:ambari_service) do
  ensurable
  newparam(:name, :namevar => true) do
  end

end