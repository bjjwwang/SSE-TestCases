; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %5, i8** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !37, metadata !DIExpression()), !dbg !38
  %6 = load i8*, i8** %dataCopy, align 8, !dbg !39
  store i8* %6, i8** %data2, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !59
  store i64 %call5, i64* %destLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !64
  %8 = load i64, i64* %destLen, align 8, !dbg !66
  %cmp6 = icmp ult i64 %7, %8, !dbg !67
  br i1 %cmp6, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data2, align 8, !dbg !69
  %10 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !69
  %11 = load i8, i8* %arrayidx7, align 1, !dbg !69
  %12 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !73
  store i8 %11, i8* %arrayidx8, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %13, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx9, align 1, !dbg !82
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  call void @printLine(i8* noundef %arraydecay10), !dbg !84
  %14 = load i8*, i8** %data2, align 8, !dbg !85
  call void @free(i8* noundef %14), !dbg !86
  ret void, !dbg !87
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
define void @CWE126_Buffer_Overread__malloc_char_loop_31_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__malloc_char_loop_31_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__malloc_char_loop_31_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  store i8* null, i8** %data, align 8, !dbg !113
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !122
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !125, metadata !DIExpression()), !dbg !127
  %5 = load i8*, i8** %data, align 8, !dbg !128
  store i8* %5, i8** %dataCopy, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !129, metadata !DIExpression()), !dbg !130
  %6 = load i8*, i8** %dataCopy, align 8, !dbg !131
  store i8* %6, i8** %data2, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !139
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx3, align 1, !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !143
  store i64 %call5, i64* %destLen, align 8, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !148
  %8 = load i64, i64* %destLen, align 8, !dbg !150
  %cmp6 = icmp ult i64 %7, %8, !dbg !151
  br i1 %cmp6, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data2, align 8, !dbg !153
  %10 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !153
  %11 = load i8, i8* %arrayidx7, align 1, !dbg !153
  %12 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %12, !dbg !157
  store i8 %11, i8* %arrayidx8, align 1, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %13, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !164
  store i8 0, i8* %arrayidx9, align 1, !dbg !165
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @printLine(i8* noundef %arraydecay10), !dbg !167
  %14 = load i8*, i8** %data2, align 8, !dbg !168
  call void @free(i8* noundef %14), !dbg !169
  ret void, !dbg !170
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 28, column: 20, scope: !14)
!23 = !DILocation(line: 28, column: 10, scope: !14)
!24 = !DILocation(line: 29, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!26 = !DILocation(line: 29, column: 14, scope: !25)
!27 = !DILocation(line: 29, column: 9, scope: !14)
!28 = !DILocation(line: 29, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 23)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 31, column: 5, scope: !14)
!32 = !DILocation(line: 31, column: 16, scope: !14)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !15, line: 33, type: !3)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 16, scope: !34)
!36 = !DILocation(line: 33, column: 27, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 34, type: !3)
!38 = !DILocation(line: 34, column: 16, scope: !34)
!39 = !DILocation(line: 34, column: 23, scope: !34)
!40 = !DILocalVariable(name: "i", scope: !41, file: !15, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !45, line: 94, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 20, scope: !41)
!48 = !DILocalVariable(name: "destLen", scope: !41, file: !15, line: 36, type: !42)
!49 = !DILocation(line: 36, column: 23, scope: !41)
!50 = !DILocalVariable(name: "dest", scope: !41, file: !15, line: 37, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 37, column: 18, scope: !41)
!55 = !DILocation(line: 38, column: 13, scope: !41)
!56 = !DILocation(line: 39, column: 13, scope: !41)
!57 = !DILocation(line: 39, column: 25, scope: !41)
!58 = !DILocation(line: 40, column: 30, scope: !41)
!59 = !DILocation(line: 40, column: 23, scope: !41)
!60 = !DILocation(line: 40, column: 21, scope: !41)
!61 = !DILocation(line: 43, column: 20, scope: !62)
!62 = distinct !DILexicalBlock(scope: !41, file: !15, line: 43, column: 13)
!63 = !DILocation(line: 43, column: 18, scope: !62)
!64 = !DILocation(line: 43, column: 25, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !15, line: 43, column: 13)
!66 = !DILocation(line: 43, column: 29, scope: !65)
!67 = !DILocation(line: 43, column: 27, scope: !65)
!68 = !DILocation(line: 43, column: 13, scope: !62)
!69 = !DILocation(line: 45, column: 27, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !15, line: 44, column: 13)
!71 = !DILocation(line: 45, column: 32, scope: !70)
!72 = !DILocation(line: 45, column: 22, scope: !70)
!73 = !DILocation(line: 45, column: 17, scope: !70)
!74 = !DILocation(line: 45, column: 25, scope: !70)
!75 = !DILocation(line: 46, column: 13, scope: !70)
!76 = !DILocation(line: 43, column: 39, scope: !65)
!77 = !DILocation(line: 43, column: 13, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 46, column: 13, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 47, column: 13, scope: !41)
!82 = !DILocation(line: 47, column: 25, scope: !41)
!83 = !DILocation(line: 48, column: 23, scope: !41)
!84 = !DILocation(line: 48, column: 13, scope: !41)
!85 = !DILocation(line: 49, column: 18, scope: !41)
!86 = !DILocation(line: 49, column: 13, scope: !41)
!87 = !DILocation(line: 52, column: 1, scope: !14)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_31_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!89 = !DILocation(line: 92, column: 5, scope: !88)
!90 = !DILocation(line: 93, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !92, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94, !95}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !15, line: 104, type: !94)
!97 = !DILocation(line: 104, column: 14, scope: !91)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !15, line: 104, type: !95)
!99 = !DILocation(line: 104, column: 27, scope: !91)
!100 = !DILocation(line: 107, column: 22, scope: !91)
!101 = !DILocation(line: 107, column: 12, scope: !91)
!102 = !DILocation(line: 107, column: 5, scope: !91)
!103 = !DILocation(line: 109, column: 5, scope: !91)
!104 = !DILocation(line: 110, column: 5, scope: !91)
!105 = !DILocation(line: 111, column: 5, scope: !91)
!106 = !DILocation(line: 114, column: 5, scope: !91)
!107 = !DILocation(line: 115, column: 5, scope: !91)
!108 = !DILocation(line: 116, column: 5, scope: !91)
!109 = !DILocation(line: 118, column: 5, scope: !91)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 61, type: !3)
!112 = !DILocation(line: 61, column: 12, scope: !110)
!113 = !DILocation(line: 62, column: 10, scope: !110)
!114 = !DILocation(line: 64, column: 20, scope: !110)
!115 = !DILocation(line: 64, column: 10, scope: !110)
!116 = !DILocation(line: 65, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !15, line: 65, column: 9)
!118 = !DILocation(line: 65, column: 14, scope: !117)
!119 = !DILocation(line: 65, column: 9, scope: !110)
!120 = !DILocation(line: 65, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 65, column: 23)
!122 = !DILocation(line: 66, column: 5, scope: !110)
!123 = !DILocation(line: 67, column: 5, scope: !110)
!124 = !DILocation(line: 67, column: 17, scope: !110)
!125 = !DILocalVariable(name: "dataCopy", scope: !126, file: !15, line: 69, type: !3)
!126 = distinct !DILexicalBlock(scope: !110, file: !15, line: 68, column: 5)
!127 = !DILocation(line: 69, column: 16, scope: !126)
!128 = !DILocation(line: 69, column: 27, scope: !126)
!129 = !DILocalVariable(name: "data", scope: !126, file: !15, line: 70, type: !3)
!130 = !DILocation(line: 70, column: 16, scope: !126)
!131 = !DILocation(line: 70, column: 23, scope: !126)
!132 = !DILocalVariable(name: "i", scope: !133, file: !15, line: 72, type: !42)
!133 = distinct !DILexicalBlock(scope: !126, file: !15, line: 71, column: 9)
!134 = !DILocation(line: 72, column: 20, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !15, line: 72, type: !42)
!136 = !DILocation(line: 72, column: 23, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !15, line: 73, type: !51)
!138 = !DILocation(line: 73, column: 18, scope: !133)
!139 = !DILocation(line: 74, column: 13, scope: !133)
!140 = !DILocation(line: 75, column: 13, scope: !133)
!141 = !DILocation(line: 75, column: 25, scope: !133)
!142 = !DILocation(line: 76, column: 30, scope: !133)
!143 = !DILocation(line: 76, column: 23, scope: !133)
!144 = !DILocation(line: 76, column: 21, scope: !133)
!145 = !DILocation(line: 79, column: 20, scope: !146)
!146 = distinct !DILexicalBlock(scope: !133, file: !15, line: 79, column: 13)
!147 = !DILocation(line: 79, column: 18, scope: !146)
!148 = !DILocation(line: 79, column: 25, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 79, column: 13)
!150 = !DILocation(line: 79, column: 29, scope: !149)
!151 = !DILocation(line: 79, column: 27, scope: !149)
!152 = !DILocation(line: 79, column: 13, scope: !146)
!153 = !DILocation(line: 81, column: 27, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !15, line: 80, column: 13)
!155 = !DILocation(line: 81, column: 32, scope: !154)
!156 = !DILocation(line: 81, column: 22, scope: !154)
!157 = !DILocation(line: 81, column: 17, scope: !154)
!158 = !DILocation(line: 81, column: 25, scope: !154)
!159 = !DILocation(line: 82, column: 13, scope: !154)
!160 = !DILocation(line: 79, column: 39, scope: !149)
!161 = !DILocation(line: 79, column: 13, scope: !149)
!162 = distinct !{!162, !152, !163, !80}
!163 = !DILocation(line: 82, column: 13, scope: !146)
!164 = !DILocation(line: 83, column: 13, scope: !133)
!165 = !DILocation(line: 83, column: 25, scope: !133)
!166 = !DILocation(line: 84, column: 23, scope: !133)
!167 = !DILocation(line: 84, column: 13, scope: !133)
!168 = !DILocation(line: 85, column: 18, scope: !133)
!169 = !DILocation(line: 85, column: 13, scope: !133)
!170 = !DILocation(line: 88, column: 1, scope: !110)
