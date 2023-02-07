htop
ls
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-MacOSX-x86_64.pkg
bash Anaconda3-2022.10-MacOSX-x86_64.pkg
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
bash Anaconda3-2022.10-Linux-x86_64.sh
ls
less .bashrc
ls
which python
ls
conda init
which conda
bash Anaconda3-2022.10-Linux-x86_64.sh
conda init
bash Anaconda3-2022.10-Linux-x86_64.sh -u
ls
which python
sudo apt update && sudo apt install make git gzip -y
docker run --rm hello-world
ls
cd ~ && git clone https://github.com/dr563105/de_zc2023.git
cd de_zc2023/
ls
make install_docker
source ~/.bashrc
docker run --rm hello-world
cd
ls
echo 'export PATH="/home/'$USER'/soft:$PATH"'
sudo groupadd docker
sudo usermod -aG docker $USER
cd de_zc2023/
docker run --rm hello-world
docker run --help
sudo usermod -aG docker ${USER}
su -s ${USER}
docker run hello-world
docker run --rm hello-world
cd ~/de_zc2023
make download_data
ls
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export POSTGRES_DB=nyc-taxi-db
cd ~/de_zc2023
make start_db
docker ps
docker exec -it de_zc2023-nytaxi_postgres-1 psql -U postgres nyc-taxi-db
docker ps
cd
ls
cd de_zc2023/
ls
terraform version
cd 
ls
cd bin
mkdir bin
cd bin
ls
wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
unzip terraform_1.3.7_linux_amd64.zip
cd
sudo apt install unzip
cd bin
ls
unzip terraform_1.3.7_linux_amd64.zip
cd
ls
rm Anaconda3-2022.10-Linux-x86_64.sh
rm Anaconda3-2022.10-MacOSX-x86_64.pkg
ls
cd de_zc2023/
ls
cd
ls
cd bin
ls
cd
terraform version
ls
cd de_zc2023/
terraform -version
cd
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform -version
ls
cd bin
ls
cd
ls
cd .gc/
ls
cd
ls
cd de_zc2023/
ls
cd infrastructure/
ls
export GOOGLE_APPLICATION_CREDENTIALS=~/.gc/pristine-flames-375008-483b916431c9.json
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
ls
terraform init
terraform plan
docker ps
ls
cd infrastructure/
terraform init
terraform plan
terraform state show
terraform state show -state=statefile
terraform state list
cd
curl https://install.terraform.io/tfe/uninstall > uninstall.sh
ls
chmod +x uninstall.sh
sudo bash uninstall.sh
cd infrastructure
ls
rm uninstall.sh 
ls
cd de_zc2023/
ls
cd infrastructure/
gcloud -v
cd
cd bin
ls
cd
ls *.json
cd .gc
ls
gcloud auth list
cd
cd bin
ls
rm terraform
rm terraform_1.3.7_linux_amd64.zip 
ls
cd
terraform -version
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform -version
cd de_zc2023/
terraform -version
cd infrastructure/
ls
terraform -version
cd
cd bin
ls
wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
unzip terraform_1.3.7_linux_amd64.zip
ls
rm terraform_1.3.7_linux_amd64.zip 
ls
cd
terraform -version
cd
ls
cd de_zc2023/
ls
cd infrastructure/
ls
terraform init
terraform plan
terraform apply
gcloud auth application-default login
echo $GOOGLE_APPLICATION_CREDENTIALS
cd
cd .gc
ls
touch pristine-flames-375008-483b916431c9.json 
cat pristine-flames-375008-483b916431c9.json 
realpath pristine-flames-375008-483b916431c9.json
cd
export GOOGLE_APPLICATION_CREDENTIALS="/home/olivermills/.gc/pristine-flames-375008-483b916431c9.json"
gcloud auth application-default login
cd de_zc2023/infrastructure/
ls
terraform init
terraform plan
terraform apply
terraform destroy
docker ps
cd
cd de_zc2023/
ls
cd
ls
cd de
cd de_zc2023/
ls
cd
ls
git clone https://github.com/discdiver/prefect-zoomcamp.git
ls
code .
conda create -n zoomcamp python=3.9
conda activate zoomcamp
ls
cd prefect-zoomcamp/
ls
pip install -r requirements.txt
prefect version
docker ps
ls
cd
ls
cd de_zc2023/
ls
docker exec -it de_zc2023-nytaxi_postgres-1 psql -U postgres nyc-taxi-db
python ingest_data.py
conda activate zoomcamp
python ingest_data.py
docker exec -it de_zc2023-nytaxi_postgres-1 psql -U postgres nyc-taxi-db
conda activate zoomcamp
cd
ls
cd prefect-zoomcamp/
ls
cd flows/
ls
cd 01_start/
ls
python ingest_data.py
prefect orion start
docker ps
psql -U postgres nyc-taxi-db
docker exec -it de_zc2023-nytaxi_postgres-1 psql -U postgres nyc-taxi-db
conda activate zoomcamp
prefect config set PREFECT_API_URL=http://127.0.0.1:4200/api
conda activate zoomcamp
docker exec -it de_zc2023-nytaxi_postgres-1 psql -U postgres nyc-taxi-db
python ingest_data.py
conda activate zoomcamp
prefect orion start
conda activate zoomcamp
/home/olivermills/anaconda3/envs/zoomcamp/bin/python
conda activate zoomcamp
ls
python etl_web_to_gcs_om.py
ls
python etl_web_to_gcs.py
cd
ls
cd prefect-zoomcamp/
python flows/02_gcp/etl_web_to_gcs.py
python flows/02_gcp/etl_web_to_gcs_om.py
conda activate zoomcamp
python etl_web_to_gcs_om.py
prefect orion start
conda activate zoomcamp
conda activate zoomcamp
python flows/02_gcp/etl_web_to_gcs_om.py
conda activate zoomcamp
prefect block register -m prefect_gcp
conda activate zoomcamp
conda activate zoomcamp
python flows/02_gcp/etl_etl_web_to_gcs_om.py
python flows/02_gcp/etl_web_to_gcs_om.py
python flows/02_gcp/etl_web_to_gcs.py
conda activate zoomcamp
conda activate zoomcamp
docker ps
prefect block register -m prefect_gcp
prefect orion start
conda activate zoomcamp
cd prefect-zoomcamp/
python flows/etl_gcs_to_bq_om.py
python flows/02_gcp/etl_gcs_to_bq_om.py
conda activate zoomcamp
prefect orion start
conda activate zoomcamp
cd prefect-zoomcamp/
ls
prefect deployment build flows/03_deployments/param_flow_om.py:etl_parent_flow -n etl2 --cron "0 0 * * *"
prefect deployment build flows/03_deployments/param_flow_om.py:etl_parent_flow -n etl2 --cron "0 0 * * *" -a
conda activate zoomcamp
prefect orion start
conda activate zoomcamp
docker ps
cd prefect-zoomcamp/
ls
python flows/03_deployments/param_flow_om.py
prefect deployment build ./flows/03_deployments/param_flow_om.py:etl_parent_flow -n "Parameterized ETL"
prefect deployment apply etl_parent_flow-deployment.yaml
prefect agent start  --work-queue "default"
conda activate python
conda info --envs
conda activate zoomcamp
cd prefect-zoomcamp/
ls
docker image build -t olivermills/zoomcamp:prefect .
docker image push olivermills/zoomcamp:prefect
docker login
docker image push olivermills/zoomcamp:prefect
prefect orion start
conda activate zoomcamp
python flows/03_deployments/docker_deploy.py 
prefect profile ls
prefect config set PREFECT_API_URL=http://127.0.0.1:4200/api
prefect agent start -q default
conda activate zoomcamp
cd prefect-zoomcamp/
prefect deployment run etl-parent-flow
/
prefect deployment run etl-parent-flow/docker-flow -p "months=[1,2]"
prefect config set PREFECT_TASKS_REFRESH_CACHE="true"
prefect deployment run etl-parent-flow/docker-flow -p "months=[1,2]"
prefect cloud login
python flows/02_gcp/etl_web_to_gcs.py 
prefect deployment build flows/02_gcp/etl_web_to_gcs.py:cron_test -n etl_web_to_gcs --cron "0 5 1 * *"
prefect deployment build flows/02_gcp/etl_web_to_gcs.py:etl_web_to_gcs -n cron_test --cron "0 5 1 * *"
prefect deployment build flows/03_deployments/parameterized_flow.py:etl_parent_flow -n cron_test --cron "0 5 1 * *"
prefect deployment build flows/03_deployments/parameterized_flow.py:etl_parent_flow -n cron_test --cron "0 5 1 * *" -a
python flows/03_deployments/parameterized_flow.py
conda activate zoomcamp
prefect orion start
conda activate zoomcamp
python flows/02_gcp/etl_gcs_to_bq.py
python 7019375 + 7832545
7019375 + 7832545
echo "$(($7019375+$7832545))"
expr $7832545 + $7019375
conda activate zoomcamp
prefect orion start
conda activate zoomcamp
cd prefect-zoomcamp/
python flows/02_gcp/etl_web_to_gcs.py 
cd
git remote add origin https://github.com/olivermills/de-zoomcamp-course.git
git init
git add README.md
touch README.md
touch .gitignore
git commit -m "first commit"
git config --global user.name "olivarski@gmail.com"
git config --global user.email "olivarski@gmail.com"
git commit -m "first commit"
git add prefect-zoomcamp/
conda activate zoomcamp
prefect orion startr
prefect orion start
ls
cd
git ls-tree -r master --name-only
git ls-files
git --version
git ls-tree -r origin
git ls-tree -r master --name-only
git log
git remote -v
git status
git rm --cached prefect-zoomcamp
git add -A
git status
git add -A
