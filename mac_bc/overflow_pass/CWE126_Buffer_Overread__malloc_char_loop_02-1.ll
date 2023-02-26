; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !32
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !45, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx2, align 1, !dbg !52
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !54
  store i64 %call4, i64* %destLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !59
  %6 = load i64, i64* %destLen, align 8, !dbg !61
  %cmp5 = icmp ult i64 %5, %6, !dbg !62
  br i1 %cmp5, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !64
  %8 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !64
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !64
  %10 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !68
  store i8 %9, i8* %arrayidx7, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %11, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx8, align 1, !dbg !77
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* noundef %arraydecay9), !dbg !79
  %12 = load i8*, i8** %data, align 8, !dbg !80
  call void @free(i8* noundef %12), !dbg !81
  ret void, !dbg !82
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
define void @CWE126_Buffer_Overread__malloc_char_loop_02_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__malloc_char_loop_02_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__malloc_char_loop_02_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !120
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !120
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx2, align 1, !dbg !132
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !134
  store i64 %call4, i64* %destLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !139
  %6 = load i64, i64* %destLen, align 8, !dbg !141
  %cmp5 = icmp ult i64 %5, %6, !dbg !142
  br i1 %cmp5, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !144
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !144
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !144
  %10 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !148
  store i8 %9, i8* %arrayidx7, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %11, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx8, align 1, !dbg !156
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* noundef %arraydecay9), !dbg !158
  %12 = load i8*, i8** %data, align 8, !dbg !159
  call void @free(i8* noundef %12), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !163, metadata !DIExpression()), !dbg !164
  store i8* null, i8** %data, align 8, !dbg !165
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !166
  store i8* %call, i8** %data, align 8, !dbg !169
  %0 = load i8*, i8** %data, align 8, !dbg !170
  %cmp = icmp eq i8* %0, null, !dbg !172
  br i1 %cmp, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !174
  unreachable, !dbg !174

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !176
  %2 = load i8*, i8** %data, align 8, !dbg !176
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !176
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !176
  %4 = load i8*, i8** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !177
  store i8 0, i8* %arrayidx, align 1, !dbg !178
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !184, metadata !DIExpression()), !dbg !185
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !186
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !186
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !187
  store i8 0, i8* %arrayidx2, align 1, !dbg !188
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !189
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !190
  store i64 %call4, i64* %destLen, align 8, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !195
  %6 = load i64, i64* %destLen, align 8, !dbg !197
  %cmp5 = icmp ult i64 %5, %6, !dbg !198
  br i1 %cmp5, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !200
  %8 = load i64, i64* %i, align 8, !dbg !202
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !200
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !200
  %10 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !204
  store i8 %9, i8* %arrayidx7, align 1, !dbg !205
  br label %for.inc, !dbg !206

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !207
  %inc = add i64 %11, 1, !dbg !207
  store i64 %inc, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !208, !llvm.loop !209

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !211
  store i8 0, i8* %arrayidx8, align 1, !dbg !212
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !213
  call void @printLine(i8* noundef %arraydecay9), !dbg !214
  %12 = load i8*, i8** %data, align 8, !dbg !215
  call void @free(i8* noundef %12), !dbg !216
  ret void, !dbg !217
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_02_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 30, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!25 = !DILocation(line: 30, column: 14, scope: !23)
!26 = !DILocation(line: 31, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 13)
!28 = !DILocation(line: 31, column: 18, scope: !27)
!29 = !DILocation(line: 31, column: 13, scope: !23)
!30 = !DILocation(line: 31, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 27)
!32 = !DILocation(line: 32, column: 9, scope: !23)
!33 = !DILocation(line: 33, column: 9, scope: !23)
!34 = !DILocation(line: 33, column: 20, scope: !23)
!35 = !DILocalVariable(name: "i", scope: !36, file: !15, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 31, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !40, line: 94, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 36, column: 16, scope: !36)
!43 = !DILocalVariable(name: "destLen", scope: !36, file: !15, line: 36, type: !37)
!44 = !DILocation(line: 36, column: 19, scope: !36)
!45 = !DILocalVariable(name: "dest", scope: !36, file: !15, line: 37, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 37, column: 14, scope: !36)
!50 = !DILocation(line: 38, column: 9, scope: !36)
!51 = !DILocation(line: 39, column: 9, scope: !36)
!52 = !DILocation(line: 39, column: 21, scope: !36)
!53 = !DILocation(line: 40, column: 26, scope: !36)
!54 = !DILocation(line: 40, column: 19, scope: !36)
!55 = !DILocation(line: 40, column: 17, scope: !36)
!56 = !DILocation(line: 43, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !36, file: !15, line: 43, column: 9)
!58 = !DILocation(line: 43, column: 14, scope: !57)
!59 = !DILocation(line: 43, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !15, line: 43, column: 9)
!61 = !DILocation(line: 43, column: 25, scope: !60)
!62 = !DILocation(line: 43, column: 23, scope: !60)
!63 = !DILocation(line: 43, column: 9, scope: !57)
!64 = !DILocation(line: 45, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !15, line: 44, column: 9)
!66 = !DILocation(line: 45, column: 28, scope: !65)
!67 = !DILocation(line: 45, column: 18, scope: !65)
!68 = !DILocation(line: 45, column: 13, scope: !65)
!69 = !DILocation(line: 45, column: 21, scope: !65)
!70 = !DILocation(line: 46, column: 9, scope: !65)
!71 = !DILocation(line: 43, column: 35, scope: !60)
!72 = !DILocation(line: 43, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 46, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 47, column: 9, scope: !36)
!77 = !DILocation(line: 47, column: 21, scope: !36)
!78 = !DILocation(line: 48, column: 19, scope: !36)
!79 = !DILocation(line: 48, column: 9, scope: !36)
!80 = !DILocation(line: 49, column: 14, scope: !36)
!81 = !DILocation(line: 49, column: 9, scope: !36)
!82 = !DILocation(line: 51, column: 1, scope: !14)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_02_good", scope: !15, file: !15, line: 124, type: !16, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!84 = !DILocation(line: 126, column: 5, scope: !83)
!85 = !DILocation(line: 127, column: 5, scope: !83)
!86 = !DILocation(line: 128, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 140, type: !88, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !15, line: 140, type: !90)
!93 = !DILocation(line: 140, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !15, line: 140, type: !91)
!95 = !DILocation(line: 140, column: 27, scope: !87)
!96 = !DILocation(line: 143, column: 22, scope: !87)
!97 = !DILocation(line: 143, column: 12, scope: !87)
!98 = !DILocation(line: 143, column: 5, scope: !87)
!99 = !DILocation(line: 145, column: 5, scope: !87)
!100 = !DILocation(line: 146, column: 5, scope: !87)
!101 = !DILocation(line: 147, column: 5, scope: !87)
!102 = !DILocation(line: 150, column: 5, scope: !87)
!103 = !DILocation(line: 151, column: 5, scope: !87)
!104 = !DILocation(line: 152, column: 5, scope: !87)
!105 = !DILocation(line: 154, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!107 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 60, type: !3)
!108 = !DILocation(line: 60, column: 12, scope: !106)
!109 = !DILocation(line: 61, column: 10, scope: !106)
!110 = !DILocation(line: 70, column: 24, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !15, line: 68, column: 5)
!112 = distinct !DILexicalBlock(scope: !106, file: !15, line: 62, column: 8)
!113 = !DILocation(line: 70, column: 14, scope: !111)
!114 = !DILocation(line: 71, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !15, line: 71, column: 13)
!116 = !DILocation(line: 71, column: 18, scope: !115)
!117 = !DILocation(line: 71, column: 13, scope: !111)
!118 = !DILocation(line: 71, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 71, column: 27)
!120 = !DILocation(line: 72, column: 9, scope: !111)
!121 = !DILocation(line: 73, column: 9, scope: !111)
!122 = !DILocation(line: 73, column: 21, scope: !111)
!123 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 76, type: !37)
!124 = distinct !DILexicalBlock(scope: !106, file: !15, line: 75, column: 5)
!125 = !DILocation(line: 76, column: 16, scope: !124)
!126 = !DILocalVariable(name: "destLen", scope: !124, file: !15, line: 76, type: !37)
!127 = !DILocation(line: 76, column: 19, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 77, type: !46)
!129 = !DILocation(line: 77, column: 14, scope: !124)
!130 = !DILocation(line: 78, column: 9, scope: !124)
!131 = !DILocation(line: 79, column: 9, scope: !124)
!132 = !DILocation(line: 79, column: 21, scope: !124)
!133 = !DILocation(line: 80, column: 26, scope: !124)
!134 = !DILocation(line: 80, column: 19, scope: !124)
!135 = !DILocation(line: 80, column: 17, scope: !124)
!136 = !DILocation(line: 83, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !15, line: 83, column: 9)
!138 = !DILocation(line: 83, column: 14, scope: !137)
!139 = !DILocation(line: 83, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 83, column: 9)
!141 = !DILocation(line: 83, column: 25, scope: !140)
!142 = !DILocation(line: 83, column: 23, scope: !140)
!143 = !DILocation(line: 83, column: 9, scope: !137)
!144 = !DILocation(line: 85, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 84, column: 9)
!146 = !DILocation(line: 85, column: 28, scope: !145)
!147 = !DILocation(line: 85, column: 18, scope: !145)
!148 = !DILocation(line: 85, column: 13, scope: !145)
!149 = !DILocation(line: 85, column: 21, scope: !145)
!150 = !DILocation(line: 86, column: 9, scope: !145)
!151 = !DILocation(line: 83, column: 35, scope: !140)
!152 = !DILocation(line: 83, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !75}
!154 = !DILocation(line: 86, column: 9, scope: !137)
!155 = !DILocation(line: 87, column: 9, scope: !124)
!156 = !DILocation(line: 87, column: 21, scope: !124)
!157 = !DILocation(line: 88, column: 19, scope: !124)
!158 = !DILocation(line: 88, column: 9, scope: !124)
!159 = !DILocation(line: 89, column: 14, scope: !124)
!160 = !DILocation(line: 89, column: 9, scope: !124)
!161 = !DILocation(line: 91, column: 1, scope: !106)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!163 = !DILocalVariable(name: "data", scope: !162, file: !15, line: 96, type: !3)
!164 = !DILocation(line: 96, column: 12, scope: !162)
!165 = !DILocation(line: 97, column: 10, scope: !162)
!166 = !DILocation(line: 101, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !168, file: !15, line: 99, column: 5)
!168 = distinct !DILexicalBlock(scope: !162, file: !15, line: 98, column: 8)
!169 = !DILocation(line: 101, column: 14, scope: !167)
!170 = !DILocation(line: 102, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 102, column: 13)
!172 = !DILocation(line: 102, column: 18, scope: !171)
!173 = !DILocation(line: 102, column: 13, scope: !167)
!174 = !DILocation(line: 102, column: 28, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !15, line: 102, column: 27)
!176 = !DILocation(line: 103, column: 9, scope: !167)
!177 = !DILocation(line: 104, column: 9, scope: !167)
!178 = !DILocation(line: 104, column: 21, scope: !167)
!179 = !DILocalVariable(name: "i", scope: !180, file: !15, line: 107, type: !37)
!180 = distinct !DILexicalBlock(scope: !162, file: !15, line: 106, column: 5)
!181 = !DILocation(line: 107, column: 16, scope: !180)
!182 = !DILocalVariable(name: "destLen", scope: !180, file: !15, line: 107, type: !37)
!183 = !DILocation(line: 107, column: 19, scope: !180)
!184 = !DILocalVariable(name: "dest", scope: !180, file: !15, line: 108, type: !46)
!185 = !DILocation(line: 108, column: 14, scope: !180)
!186 = !DILocation(line: 109, column: 9, scope: !180)
!187 = !DILocation(line: 110, column: 9, scope: !180)
!188 = !DILocation(line: 110, column: 21, scope: !180)
!189 = !DILocation(line: 111, column: 26, scope: !180)
!190 = !DILocation(line: 111, column: 19, scope: !180)
!191 = !DILocation(line: 111, column: 17, scope: !180)
!192 = !DILocation(line: 114, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !180, file: !15, line: 114, column: 9)
!194 = !DILocation(line: 114, column: 14, scope: !193)
!195 = !DILocation(line: 114, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !15, line: 114, column: 9)
!197 = !DILocation(line: 114, column: 25, scope: !196)
!198 = !DILocation(line: 114, column: 23, scope: !196)
!199 = !DILocation(line: 114, column: 9, scope: !193)
!200 = !DILocation(line: 116, column: 23, scope: !201)
!201 = distinct !DILexicalBlock(scope: !196, file: !15, line: 115, column: 9)
!202 = !DILocation(line: 116, column: 28, scope: !201)
!203 = !DILocation(line: 116, column: 18, scope: !201)
!204 = !DILocation(line: 116, column: 13, scope: !201)
!205 = !DILocation(line: 116, column: 21, scope: !201)
!206 = !DILocation(line: 117, column: 9, scope: !201)
!207 = !DILocation(line: 114, column: 35, scope: !196)
!208 = !DILocation(line: 114, column: 9, scope: !196)
!209 = distinct !{!209, !199, !210, !75}
!210 = !DILocation(line: 117, column: 9, scope: !193)
!211 = !DILocation(line: 118, column: 9, scope: !180)
!212 = !DILocation(line: 118, column: 21, scope: !180)
!213 = !DILocation(line: 119, column: 19, scope: !180)
!214 = !DILocation(line: 119, column: 9, scope: !180)
!215 = !DILocation(line: 120, column: 14, scope: !180)
!216 = !DILocation(line: 120, column: 9, scope: !180)
!217 = !DILocation(line: 122, column: 1, scope: !162)
