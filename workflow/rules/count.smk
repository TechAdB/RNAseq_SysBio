rule count:
    input:
        sorted_bam = "results/hisat2/{sample}.sorted.bam",
        gtf = config["gtf_file"]
    output:
        counts = "results/counts/{sample}.featureCounts.txt",
        summary = "results/counts/{sample}.featureCounts.txt.summary"
    conda:
        "../envs/rnaseq_preprocess.yaml"
    threads: 4
    shell:
        """
        featureCounts \
            -t exon -g gene_id \
            -T {threads} \
            -a {input.gtf} \
            -o {output.counts} \
            {input.sorted_bam}
        """
