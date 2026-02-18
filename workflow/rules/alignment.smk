rule hisat2_align:
    input:
        ref = config["reference"],
        reads = lambda wc: f"{config['input_path']}/{wc.sample}_filtered.fastq"
    output:
        bam = "results/alignment/{sample}.bam"
    conda:
        "../envs/rnaseq_preprocess.yaml"
    shell:
        """
        hisat2 -x {input.ref} \
               -U {input.reads} \
        | samtools view -bS - \
        | samtools sort -o {output.bam}
        """

rule index_bam:
    input:
        bam = "results/alignment/{sample}.bam"
    output:
        bai = "results/alignment/{sample}.bam.bai"
    conda:
        "../envs/rnaseq_preprocess.yaml"
    shell:
        """
        samtools index {input.bam}
        """
