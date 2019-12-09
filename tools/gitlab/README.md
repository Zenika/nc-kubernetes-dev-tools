# Mise en place gitlab

Afin de créer la machine gitlab nécessaire pour dérouler ce workshop.
Utiliser les scripts disponibles.
Mais avant, il est nécessaire de créer un fichier `params.env`, inspirez-vous
du fichier `params.env.sample`.

- `create-gitlab-vm.sh` : crée une machine qui hébergera gitlab
- `delete-gitlab-vm.sh` : supprime la machine qui hébergera gitlab

Vous pouvez ignorer `cloud-init-script.sh` il sera envoyé sur la machine et
exécuté lors du premier démarrage.

Il vous faudra également créer un certificat valide pour votre nom de domaine
et le déposer ainsi que la clé sur la machine gitlab :

- `/srv/gitlab/config/ssl/gitlab.mondomaine.com.crt`
- `/srv/gitlab/config/ssl/gitlab.mondomaine.com.key`
