namespace :react do
  desc "Builds the React app from client/ into the Rails public/ directory"
  task :build do
    FileUtils.cd("client") do
      system("yarn build") || fail("Failed to build React app")
      FileUtils.cp_r("build/.", "../public", verbose: true)
    end
  end
end

task "assets:precompile" do
  Rake::Task["react:build"].invoke
end
