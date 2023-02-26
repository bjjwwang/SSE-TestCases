; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i64* %i, metadata !21, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !39
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !40
  store i64 %call, i64* %destLen, align 8, !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !45
  %1 = load i64, i64* %destLen, align 8, !dbg !47
  %cmp = icmp ult i64 %0, %1, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !50
  %3 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !50
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !50
  %5 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !54
  store i8 %4, i8* %arrayidx3, align 1, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %6, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx4, align 1, !dbg !63
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @printLine(i8* noundef %arraydecay5), !dbg !65
  %7 = load i8*, i8** %data.addr, align 8, !dbg !66
  call void @free(i8* noundef %7), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_41_bad() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !75
  store i8* %call, i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %cmp = icmp eq i8* %0, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !83
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !83
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !83
  %4 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %5 = load i8*, i8** %data, align 8, !dbg !86
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_badSink(i8* noundef %5), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_41_goodG2BSink(i8* noundef %data) #0 !dbg !89 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i64* %i, metadata !92, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !102
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !103
  store i64 %call, i64* %destLen, align 8, !dbg !104
  store i64 0, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !107

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !108
  %1 = load i64, i64* %destLen, align 8, !dbg !110
  %cmp = icmp ult i64 %0, %1, !dbg !111
  br i1 %cmp, label %for.body, label %for.end, !dbg !112

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !113
  %3 = load i64, i64* %i, align 8, !dbg !115
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !113
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !113
  %5 = load i64, i64* %i, align 8, !dbg !116
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !117
  store i8 %4, i8* %arrayidx3, align 1, !dbg !118
  br label %for.inc, !dbg !119

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !120
  %inc = add i64 %6, 1, !dbg !120
  store i64 %inc, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !121, !llvm.loop !122

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx4, align 1, !dbg !125
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @printLine(i8* noundef %arraydecay5), !dbg !127
  %7 = load i8*, i8** %data.addr, align 8, !dbg !128
  call void @free(i8* noundef %7), !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_41_good() #0 !dbg !131 {
entry:
  call void @goodG2B(), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !134 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !139, metadata !DIExpression()), !dbg !140
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !141, metadata !DIExpression()), !dbg !142
  %call = call i64 @time(i64* noundef null), !dbg !143
  %conv = trunc i64 %call to i32, !dbg !144
  call void @srand(i32 noundef %conv), !dbg !145
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !146
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_good(), !dbg !147
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !148
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !149
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_bad(), !dbg !150
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !151
  ret i32 0, !dbg !152
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  store i8* null, i8** %data, align 8, !dbg !156
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !157
  store i8* %call, i8** %data, align 8, !dbg !158
  %0 = load i8*, i8** %data, align 8, !dbg !159
  %cmp = icmp eq i8* %0, null, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !165
  %2 = load i8*, i8** %data, align 8, !dbg !165
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !165
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !165
  %4 = load i8*, i8** %data, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !166
  store i8 0, i8* %arrayidx, align 1, !dbg !167
  %5 = load i8*, i8** %data, align 8, !dbg !168
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_goodG2BSink(i8* noundef %5), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 65, scope: !14)
!21 = !DILocalVariable(name: "i", scope: !22, file: !15, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !24, line: 31, baseType: !25)
!24 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !26, line: 94, baseType: !27)
!26 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!27 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!28 = !DILocation(line: 26, column: 16, scope: !22)
!29 = !DILocalVariable(name: "destLen", scope: !22, file: !15, line: 26, type: !23)
!30 = !DILocation(line: 26, column: 19, scope: !22)
!31 = !DILocalVariable(name: "dest", scope: !22, file: !15, line: 27, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 27, column: 14, scope: !22)
!36 = !DILocation(line: 28, column: 9, scope: !22)
!37 = !DILocation(line: 29, column: 9, scope: !22)
!38 = !DILocation(line: 29, column: 21, scope: !22)
!39 = !DILocation(line: 30, column: 26, scope: !22)
!40 = !DILocation(line: 30, column: 19, scope: !22)
!41 = !DILocation(line: 30, column: 17, scope: !22)
!42 = !DILocation(line: 33, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 9)
!44 = !DILocation(line: 33, column: 14, scope: !43)
!45 = !DILocation(line: 33, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !15, line: 33, column: 9)
!47 = !DILocation(line: 33, column: 25, scope: !46)
!48 = !DILocation(line: 33, column: 23, scope: !46)
!49 = !DILocation(line: 33, column: 9, scope: !43)
!50 = !DILocation(line: 35, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 34, column: 9)
!52 = !DILocation(line: 35, column: 28, scope: !51)
!53 = !DILocation(line: 35, column: 18, scope: !51)
!54 = !DILocation(line: 35, column: 13, scope: !51)
!55 = !DILocation(line: 35, column: 21, scope: !51)
!56 = !DILocation(line: 36, column: 9, scope: !51)
!57 = !DILocation(line: 33, column: 35, scope: !46)
!58 = !DILocation(line: 33, column: 9, scope: !46)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 36, column: 9, scope: !43)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 37, column: 9, scope: !22)
!63 = !DILocation(line: 37, column: 21, scope: !22)
!64 = !DILocation(line: 38, column: 19, scope: !22)
!65 = !DILocation(line: 38, column: 9, scope: !22)
!66 = !DILocation(line: 39, column: 14, scope: !22)
!67 = !DILocation(line: 39, column: 9, scope: !22)
!68 = !DILocation(line: 41, column: 1, scope: !14)
!69 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_bad", scope: !15, file: !15, line: 43, type: !70, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 45, type: !3)
!73 = !DILocation(line: 45, column: 12, scope: !69)
!74 = !DILocation(line: 46, column: 10, scope: !69)
!75 = !DILocation(line: 48, column: 20, scope: !69)
!76 = !DILocation(line: 48, column: 10, scope: !69)
!77 = !DILocation(line: 49, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 9)
!79 = !DILocation(line: 49, column: 14, scope: !78)
!80 = !DILocation(line: 49, column: 9, scope: !69)
!81 = !DILocation(line: 49, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 49, column: 23)
!83 = !DILocation(line: 50, column: 5, scope: !69)
!84 = !DILocation(line: 51, column: 5, scope: !69)
!85 = !DILocation(line: 51, column: 16, scope: !69)
!86 = !DILocation(line: 52, column: 57, scope: !69)
!87 = !DILocation(line: 52, column: 5, scope: !69)
!88 = !DILocation(line: 53, column: 1, scope: !69)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!90 = !DILocalVariable(name: "data", arg: 1, scope: !89, file: !15, line: 59, type: !3)
!91 = !DILocation(line: 59, column: 69, scope: !89)
!92 = !DILocalVariable(name: "i", scope: !93, file: !15, line: 62, type: !23)
!93 = distinct !DILexicalBlock(scope: !89, file: !15, line: 61, column: 5)
!94 = !DILocation(line: 62, column: 16, scope: !93)
!95 = !DILocalVariable(name: "destLen", scope: !93, file: !15, line: 62, type: !23)
!96 = !DILocation(line: 62, column: 19, scope: !93)
!97 = !DILocalVariable(name: "dest", scope: !93, file: !15, line: 63, type: !32)
!98 = !DILocation(line: 63, column: 14, scope: !93)
!99 = !DILocation(line: 64, column: 9, scope: !93)
!100 = !DILocation(line: 65, column: 9, scope: !93)
!101 = !DILocation(line: 65, column: 21, scope: !93)
!102 = !DILocation(line: 66, column: 26, scope: !93)
!103 = !DILocation(line: 66, column: 19, scope: !93)
!104 = !DILocation(line: 66, column: 17, scope: !93)
!105 = !DILocation(line: 69, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !93, file: !15, line: 69, column: 9)
!107 = !DILocation(line: 69, column: 14, scope: !106)
!108 = !DILocation(line: 69, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !15, line: 69, column: 9)
!110 = !DILocation(line: 69, column: 25, scope: !109)
!111 = !DILocation(line: 69, column: 23, scope: !109)
!112 = !DILocation(line: 69, column: 9, scope: !106)
!113 = !DILocation(line: 71, column: 23, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !15, line: 70, column: 9)
!115 = !DILocation(line: 71, column: 28, scope: !114)
!116 = !DILocation(line: 71, column: 18, scope: !114)
!117 = !DILocation(line: 71, column: 13, scope: !114)
!118 = !DILocation(line: 71, column: 21, scope: !114)
!119 = !DILocation(line: 72, column: 9, scope: !114)
!120 = !DILocation(line: 69, column: 35, scope: !109)
!121 = !DILocation(line: 69, column: 9, scope: !109)
!122 = distinct !{!122, !112, !123, !61}
!123 = !DILocation(line: 72, column: 9, scope: !106)
!124 = !DILocation(line: 73, column: 9, scope: !93)
!125 = !DILocation(line: 73, column: 21, scope: !93)
!126 = !DILocation(line: 74, column: 19, scope: !93)
!127 = !DILocation(line: 74, column: 9, scope: !93)
!128 = !DILocation(line: 75, column: 14, scope: !93)
!129 = !DILocation(line: 75, column: 9, scope: !93)
!130 = !DILocation(line: 77, column: 1, scope: !89)
!131 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_good", scope: !15, file: !15, line: 92, type: !70, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!132 = !DILocation(line: 94, column: 5, scope: !131)
!133 = !DILocation(line: 95, column: 1, scope: !131)
!134 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 107, type: !135, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!135 = !DISubroutineType(types: !136)
!136 = !{!137, !137, !138}
!137 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!139 = !DILocalVariable(name: "argc", arg: 1, scope: !134, file: !15, line: 107, type: !137)
!140 = !DILocation(line: 107, column: 14, scope: !134)
!141 = !DILocalVariable(name: "argv", arg: 2, scope: !134, file: !15, line: 107, type: !138)
!142 = !DILocation(line: 107, column: 27, scope: !134)
!143 = !DILocation(line: 110, column: 22, scope: !134)
!144 = !DILocation(line: 110, column: 12, scope: !134)
!145 = !DILocation(line: 110, column: 5, scope: !134)
!146 = !DILocation(line: 112, column: 5, scope: !134)
!147 = !DILocation(line: 113, column: 5, scope: !134)
!148 = !DILocation(line: 114, column: 5, scope: !134)
!149 = !DILocation(line: 117, column: 5, scope: !134)
!150 = !DILocation(line: 118, column: 5, scope: !134)
!151 = !DILocation(line: 119, column: 5, scope: !134)
!152 = !DILocation(line: 121, column: 5, scope: !134)
!153 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 80, type: !70, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!154 = !DILocalVariable(name: "data", scope: !153, file: !15, line: 82, type: !3)
!155 = !DILocation(line: 82, column: 12, scope: !153)
!156 = !DILocation(line: 83, column: 10, scope: !153)
!157 = !DILocation(line: 85, column: 20, scope: !153)
!158 = !DILocation(line: 85, column: 10, scope: !153)
!159 = !DILocation(line: 86, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !15, line: 86, column: 9)
!161 = !DILocation(line: 86, column: 14, scope: !160)
!162 = !DILocation(line: 86, column: 9, scope: !153)
!163 = !DILocation(line: 86, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !15, line: 86, column: 23)
!165 = !DILocation(line: 87, column: 5, scope: !153)
!166 = !DILocation(line: 88, column: 5, scope: !153)
!167 = !DILocation(line: 88, column: 17, scope: !153)
!168 = !DILocation(line: 89, column: 61, scope: !153)
!169 = !DILocation(line: 89, column: 5, scope: !153)
!170 = !DILocation(line: 90, column: 1, scope: !153)
