rule fastp:
    input:
        f = lambda wc: f"{config['input_path']}/{wc.sample}_raw.fastq"
    output:
        filtered = f"{config['input_path']}/{{sample}}_filtered.fastq",
        html = "results/fastp/{sample}_fastp.html",
        json = "results/fastp/{sample}_fastp.json"
    conda:
        "../envs/rnaseq_preprocess.yaml"
    shell:
        """
        fastp -i {input.f} \
              -o {output.filtered} \
              -h {output.html} \
              -j {output.json}
        """
