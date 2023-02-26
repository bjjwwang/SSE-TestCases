; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !30
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx2, align 1, !dbg !50
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !52
  store i64 %call4, i64* %destLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !57
  %6 = load i64, i64* %destLen, align 8, !dbg !59
  %cmp5 = icmp ult i64 %5, %6, !dbg !60
  br i1 %cmp5, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !62
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !66
  store i8 %9, i8* %arrayidx7, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %11, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !74
  store i8 0, i8* %arrayidx8, align 1, !dbg !75
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !76
  call void @printLine(i8* noundef %arraydecay9), !dbg !77
  %12 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* noundef %12), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_15_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__malloc_char_loop_15_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__malloc_char_loop_15_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !108
  store i8* %call, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  %cmp = icmp eq i8* %0, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !116
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx2, align 1, !dbg !128
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !130
  store i64 %call4, i64* %destLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !135
  %6 = load i64, i64* %destLen, align 8, !dbg !137
  %cmp5 = icmp ult i64 %5, %6, !dbg !138
  br i1 %cmp5, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !140
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !140
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !140
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !144
  store i8 %9, i8* %arrayidx7, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %11, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !151
  store i8 0, i8* %arrayidx8, align 1, !dbg !152
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  call void @printLine(i8* noundef %arraydecay9), !dbg !154
  %12 = load i8*, i8** %data, align 8, !dbg !155
  call void @free(i8* noundef %12), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !159, metadata !DIExpression()), !dbg !160
  store i8* null, i8** %data, align 8, !dbg !161
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !162
  store i8* %call, i8** %data, align 8, !dbg !163
  %0 = load i8*, i8** %data, align 8, !dbg !164
  %cmp = icmp eq i8* %0, null, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !168
  unreachable, !dbg !168

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !170
  %2 = load i8*, i8** %data, align 8, !dbg !170
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !170
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !170
  %4 = load i8*, i8** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !180
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx2, align 1, !dbg !182
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !183
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !184
  store i64 %call4, i64* %destLen, align 8, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !189
  %6 = load i64, i64* %destLen, align 8, !dbg !191
  %cmp5 = icmp ult i64 %5, %6, !dbg !192
  br i1 %cmp5, label %for.body, label %for.end, !dbg !193

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !194
  %8 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !194
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !194
  %10 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !198
  store i8 %9, i8* %arrayidx7, align 1, !dbg !199
  br label %for.inc, !dbg !200

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !201
  %inc = add i64 %11, 1, !dbg !201
  store i64 %inc, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !202, !llvm.loop !203

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !205
  store i8 0, i8* %arrayidx8, align 1, !dbg !206
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !207
  call void @printLine(i8* noundef %arraydecay9), !dbg !208
  %12 = load i8*, i8** %data, align 8, !dbg !209
  call void @free(i8* noundef %12), !dbg !210
  ret void, !dbg !211
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 31, column: 24, scope: !14)
!23 = !DILocation(line: 31, column: 14, scope: !14)
!24 = !DILocation(line: 32, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!26 = !DILocation(line: 32, column: 18, scope: !25)
!27 = !DILocation(line: 32, column: 13, scope: !14)
!28 = !DILocation(line: 32, column: 28, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 32, column: 27)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 34, column: 9, scope: !14)
!32 = !DILocation(line: 34, column: 20, scope: !14)
!33 = !DILocalVariable(name: "i", scope: !34, file: !15, line: 42, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 31, baseType: !37)
!36 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !38, line: 94, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 42, column: 16, scope: !34)
!41 = !DILocalVariable(name: "destLen", scope: !34, file: !15, line: 42, type: !35)
!42 = !DILocation(line: 42, column: 19, scope: !34)
!43 = !DILocalVariable(name: "dest", scope: !34, file: !15, line: 43, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 43, column: 14, scope: !34)
!48 = !DILocation(line: 44, column: 9, scope: !34)
!49 = !DILocation(line: 45, column: 9, scope: !34)
!50 = !DILocation(line: 45, column: 21, scope: !34)
!51 = !DILocation(line: 46, column: 26, scope: !34)
!52 = !DILocation(line: 46, column: 19, scope: !34)
!53 = !DILocation(line: 46, column: 17, scope: !34)
!54 = !DILocation(line: 49, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !34, file: !15, line: 49, column: 9)
!56 = !DILocation(line: 49, column: 14, scope: !55)
!57 = !DILocation(line: 49, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !15, line: 49, column: 9)
!59 = !DILocation(line: 49, column: 25, scope: !58)
!60 = !DILocation(line: 49, column: 23, scope: !58)
!61 = !DILocation(line: 49, column: 9, scope: !55)
!62 = !DILocation(line: 51, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !15, line: 50, column: 9)
!64 = !DILocation(line: 51, column: 28, scope: !63)
!65 = !DILocation(line: 51, column: 18, scope: !63)
!66 = !DILocation(line: 51, column: 13, scope: !63)
!67 = !DILocation(line: 51, column: 21, scope: !63)
!68 = !DILocation(line: 52, column: 9, scope: !63)
!69 = !DILocation(line: 49, column: 35, scope: !58)
!70 = !DILocation(line: 49, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 52, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 53, column: 9, scope: !34)
!75 = !DILocation(line: 53, column: 21, scope: !34)
!76 = !DILocation(line: 54, column: 19, scope: !34)
!77 = !DILocation(line: 54, column: 9, scope: !34)
!78 = !DILocation(line: 55, column: 14, scope: !34)
!79 = !DILocation(line: 55, column: 9, scope: !34)
!80 = !DILocation(line: 57, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_15_good", scope: !15, file: !15, line: 137, type: !16, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!82 = !DILocation(line: 139, column: 5, scope: !81)
!83 = !DILocation(line: 140, column: 5, scope: !81)
!84 = !DILocation(line: 141, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 153, type: !86, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 153, type: !88)
!91 = !DILocation(line: 153, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 153, type: !89)
!93 = !DILocation(line: 153, column: 27, scope: !85)
!94 = !DILocation(line: 156, column: 22, scope: !85)
!95 = !DILocation(line: 156, column: 12, scope: !85)
!96 = !DILocation(line: 156, column: 5, scope: !85)
!97 = !DILocation(line: 158, column: 5, scope: !85)
!98 = !DILocation(line: 159, column: 5, scope: !85)
!99 = !DILocation(line: 160, column: 5, scope: !85)
!100 = !DILocation(line: 163, column: 5, scope: !85)
!101 = !DILocation(line: 164, column: 5, scope: !85)
!102 = !DILocation(line: 165, column: 5, scope: !85)
!103 = !DILocation(line: 167, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 66, type: !3)
!106 = !DILocation(line: 66, column: 12, scope: !104)
!107 = !DILocation(line: 67, column: 10, scope: !104)
!108 = !DILocation(line: 76, column: 24, scope: !104)
!109 = !DILocation(line: 76, column: 14, scope: !104)
!110 = !DILocation(line: 77, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !15, line: 77, column: 13)
!112 = !DILocation(line: 77, column: 18, scope: !111)
!113 = !DILocation(line: 77, column: 13, scope: !104)
!114 = !DILocation(line: 77, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 77, column: 27)
!116 = !DILocation(line: 78, column: 9, scope: !104)
!117 = !DILocation(line: 79, column: 9, scope: !104)
!118 = !DILocation(line: 79, column: 21, scope: !104)
!119 = !DILocalVariable(name: "i", scope: !120, file: !15, line: 83, type: !35)
!120 = distinct !DILexicalBlock(scope: !104, file: !15, line: 82, column: 5)
!121 = !DILocation(line: 83, column: 16, scope: !120)
!122 = !DILocalVariable(name: "destLen", scope: !120, file: !15, line: 83, type: !35)
!123 = !DILocation(line: 83, column: 19, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !120, file: !15, line: 84, type: !44)
!125 = !DILocation(line: 84, column: 14, scope: !120)
!126 = !DILocation(line: 85, column: 9, scope: !120)
!127 = !DILocation(line: 86, column: 9, scope: !120)
!128 = !DILocation(line: 86, column: 21, scope: !120)
!129 = !DILocation(line: 87, column: 26, scope: !120)
!130 = !DILocation(line: 87, column: 19, scope: !120)
!131 = !DILocation(line: 87, column: 17, scope: !120)
!132 = !DILocation(line: 90, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !15, line: 90, column: 9)
!134 = !DILocation(line: 90, column: 14, scope: !133)
!135 = !DILocation(line: 90, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 90, column: 9)
!137 = !DILocation(line: 90, column: 25, scope: !136)
!138 = !DILocation(line: 90, column: 23, scope: !136)
!139 = !DILocation(line: 90, column: 9, scope: !133)
!140 = !DILocation(line: 92, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !15, line: 91, column: 9)
!142 = !DILocation(line: 92, column: 28, scope: !141)
!143 = !DILocation(line: 92, column: 18, scope: !141)
!144 = !DILocation(line: 92, column: 13, scope: !141)
!145 = !DILocation(line: 92, column: 21, scope: !141)
!146 = !DILocation(line: 93, column: 9, scope: !141)
!147 = !DILocation(line: 90, column: 35, scope: !136)
!148 = !DILocation(line: 90, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !73}
!150 = !DILocation(line: 93, column: 9, scope: !133)
!151 = !DILocation(line: 94, column: 9, scope: !120)
!152 = !DILocation(line: 94, column: 21, scope: !120)
!153 = !DILocation(line: 95, column: 19, scope: !120)
!154 = !DILocation(line: 95, column: 9, scope: !120)
!155 = !DILocation(line: 96, column: 14, scope: !120)
!156 = !DILocation(line: 96, column: 9, scope: !120)
!157 = !DILocation(line: 98, column: 1, scope: !104)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 101, type: !16, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!159 = !DILocalVariable(name: "data", scope: !158, file: !15, line: 103, type: !3)
!160 = !DILocation(line: 103, column: 12, scope: !158)
!161 = !DILocation(line: 104, column: 10, scope: !158)
!162 = !DILocation(line: 109, column: 24, scope: !158)
!163 = !DILocation(line: 109, column: 14, scope: !158)
!164 = !DILocation(line: 110, column: 13, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !15, line: 110, column: 13)
!166 = !DILocation(line: 110, column: 18, scope: !165)
!167 = !DILocation(line: 110, column: 13, scope: !158)
!168 = !DILocation(line: 110, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !15, line: 110, column: 27)
!170 = !DILocation(line: 111, column: 9, scope: !158)
!171 = !DILocation(line: 112, column: 9, scope: !158)
!172 = !DILocation(line: 112, column: 21, scope: !158)
!173 = !DILocalVariable(name: "i", scope: !174, file: !15, line: 120, type: !35)
!174 = distinct !DILexicalBlock(scope: !158, file: !15, line: 119, column: 5)
!175 = !DILocation(line: 120, column: 16, scope: !174)
!176 = !DILocalVariable(name: "destLen", scope: !174, file: !15, line: 120, type: !35)
!177 = !DILocation(line: 120, column: 19, scope: !174)
!178 = !DILocalVariable(name: "dest", scope: !174, file: !15, line: 121, type: !44)
!179 = !DILocation(line: 121, column: 14, scope: !174)
!180 = !DILocation(line: 122, column: 9, scope: !174)
!181 = !DILocation(line: 123, column: 9, scope: !174)
!182 = !DILocation(line: 123, column: 21, scope: !174)
!183 = !DILocation(line: 124, column: 26, scope: !174)
!184 = !DILocation(line: 124, column: 19, scope: !174)
!185 = !DILocation(line: 124, column: 17, scope: !174)
!186 = !DILocation(line: 127, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !174, file: !15, line: 127, column: 9)
!188 = !DILocation(line: 127, column: 14, scope: !187)
!189 = !DILocation(line: 127, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !15, line: 127, column: 9)
!191 = !DILocation(line: 127, column: 25, scope: !190)
!192 = !DILocation(line: 127, column: 23, scope: !190)
!193 = !DILocation(line: 127, column: 9, scope: !187)
!194 = !DILocation(line: 129, column: 23, scope: !195)
!195 = distinct !DILexicalBlock(scope: !190, file: !15, line: 128, column: 9)
!196 = !DILocation(line: 129, column: 28, scope: !195)
!197 = !DILocation(line: 129, column: 18, scope: !195)
!198 = !DILocation(line: 129, column: 13, scope: !195)
!199 = !DILocation(line: 129, column: 21, scope: !195)
!200 = !DILocation(line: 130, column: 9, scope: !195)
!201 = !DILocation(line: 127, column: 35, scope: !190)
!202 = !DILocation(line: 127, column: 9, scope: !190)
!203 = distinct !{!203, !193, !204, !73}
!204 = !DILocation(line: 130, column: 9, scope: !187)
!205 = !DILocation(line: 131, column: 9, scope: !174)
!206 = !DILocation(line: 131, column: 21, scope: !174)
!207 = !DILocation(line: 132, column: 19, scope: !174)
!208 = !DILocation(line: 132, column: 9, scope: !174)
!209 = !DILocation(line: 133, column: 14, scope: !174)
!210 = !DILocation(line: 133, column: 9, scope: !174)
!211 = !DILocation(line: 135, column: 1, scope: !158)
