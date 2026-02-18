rule fastqc:
    input:
        f = lambda wc: f"{config['input_path']}/{wc.sample}_{wc.stage}.fastq"
    output:
        html = "results/fastqc/{sample}_{stage}_fastqc.html",
        zip = "results/fastqc/{sample}_{stage}_fastqc.zip"
    conda:
        "../envs/rnaseq_preprocess.yaml"
    shell:
        """
        fastqc {input.f} --outdir results/fastqc
        """
