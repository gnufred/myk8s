# Todo

Ideas of possible future contribs

## Fix this

```
kubeadm -v=5 init phase bootstrap-token --dry-run
[...]
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
I0302 17:23:18.917540    1983 clusterinfo.go:47] [bootstrap-token] loading admin kubeconfig
open /etc/kubernetes/tmp/kubeadm-init-dryrun2099651541/admin.conf: no such file or directory
failed to load admin kubeconfig
k8s.io/kubernetes/cmd/kubeadm/app/phases/bootstraptoken/clusterinfo.CreateBootstrapConfigMapIfNotExists
	cmd/kubeadm/app/phases/bootstraptoken/clusterinfo/clusterinfo.go:50
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/init.runBootstrapToken
	cmd/kubeadm/app/cmd/phases/init/bootstraptoken.go:109
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run.func1
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:259
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).visitAll
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:446
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:232
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).BindToCommand.func1.1
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:372
github.com/spf13/cobra.(*Command).execute
	vendor/github.com/spf13/cobra/command.go:940
github.com/spf13/cobra.(*Command).ExecuteC
	vendor/github.com/spf13/cobra/command.go:1068
github.com/spf13/cobra.(*Command).Execute
	vendor/github.com/spf13/cobra/command.go:992
k8s.io/kubernetes/cmd/kubeadm/app.Run
	cmd/kubeadm/app/kubeadm.go:50
main.main
	cmd/kubeadm/kubeadm.go:25
runtime.main
	/usr/local/go/src/runtime/proc.go:267
runtime.goexit
	/usr/local/go/src/runtime/asm_amd64.s:1650
error creating bootstrap ConfigMap
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/init.runBootstrapToken
	cmd/kubeadm/app/cmd/phases/init/bootstraptoken.go:110
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run.func1
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:259
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).visitAll
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:446
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:232
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).BindToCommand.func1.1
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:372
github.com/spf13/cobra.(*Command).execute
	vendor/github.com/spf13/cobra/command.go:940
github.com/spf13/cobra.(*Command).ExecuteC
	vendor/github.com/spf13/cobra/command.go:1068
github.com/spf13/cobra.(*Command).Execute
	vendor/github.com/spf13/cobra/command.go:992
k8s.io/kubernetes/cmd/kubeadm/app.Run
	cmd/kubeadm/app/kubeadm.go:50
main.main
	cmd/kubeadm/kubeadm.go:25
runtime.main
	/usr/local/go/src/runtime/proc.go:267
runtime.goexit
	/usr/local/go/src/runtime/asm_amd64.s:1650
error execution phase bootstrap-token
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run.func1
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:260
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).visitAll
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:446
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).Run
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:232
k8s.io/kubernetes/cmd/kubeadm/app/cmd/phases/workflow.(*Runner).BindToCommand.func1.1
	cmd/kubeadm/app/cmd/phases/workflow/runner.go:372
github.com/spf13/cobra.(*Command).execute
	vendor/github.com/spf13/cobra/command.go:940
github.com/spf13/cobra.(*Command).ExecuteC
	vendor/github.com/spf13/cobra/command.go:1068
github.com/spf13/cobra.(*Command).Execute
	vendor/github.com/spf13/cobra/command.go:992
k8s.io/kubernetes/cmd/kubeadm/app.Run
	cmd/kubeadm/app/kubeadm.go:50
main.main
	cmd/kubeadm/kubeadm.go:25
runtime.main
	/usr/local/go/src/runtime/proc.go:267
runtime.goexit
	/usr/local/go/src/runtime/asm_amd64.s:1650
```
