# set parms by command

time=$1


for bc in {xxx} # add packages
do
../tools/klee-symsize/build/bin/klee -allocate-sym-size=1 -capacity=100 -sym-size-mode=eager --simplify-sym-indices --write-cvcs --write-cov --output-module \
--max-memory=1000 --disable-inlining --optimize \
--use-forked-solver -use-loop-merge=1 -use-optimized-merge=1 -optimize-ite-using-exec-tree=1 -optimize-array-ite-using-exec-tree=1 \
--use-cex-cache --libc=uclibc --posix-runtime \
--external-calls=all --only-output-states-covering-new \
--env-file=test.env --run-in-dir=/tmp/sandbox \
--max-sym-array-size=4096 --max-solver-time=30s --max-time=$time\min \
--watchdog --max-memory-inhibit=false --max-static-fork-pct=1 \
--max-static-solve-pct=1 --max-static-cpfork-pct=1 --switch-type=internal \
--search=bfs \
--use-batching-search --batch-instructions=10000 \
--output-dir="sym-size-out-$time-min-bfs-$bc" \
./$bc.bc --model-symbolic-size --model-symbolic-fd-size -sym-args 0 1 10 --sym-args 0 2 2 --sym-files 1 8 --sym-stdin 8 --sym-stdout
done