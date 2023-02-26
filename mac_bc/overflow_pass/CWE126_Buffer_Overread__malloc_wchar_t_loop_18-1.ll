; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  br label %source, !dbg !26

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !27), !dbg !28
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call5 = call i64 @wcslen(i32* noundef %arraydecay4), !dbg !61
  store i64 %call5, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !66
  %5 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp6 = icmp ult i64 %4, %5, !dbg !69
  br i1 %cmp6, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !71
  %7 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !71
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !71
  %9 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !75
  store i32 %8, i32* %arrayidx8, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %10, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx9, align 4, !dbg !84
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  call void @printWLine(i32* noundef %arraydecay10), !dbg !86
  %11 = load i32*, i32** %data, align 8, !dbg !87
  %12 = bitcast i32* %11 to i8*, !dbg !87
  call void @free(i8* noundef %12), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  br label %source, !dbg !117

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !118), !dbg !119
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !120
  %0 = bitcast i8* %call to i32*, !dbg !121
  store i32* %0, i32** %data, align 8, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  %cmp = icmp eq i32* %1, null, !dbg !125
  br i1 %cmp, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #6, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !129
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !130
  %3 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx3, align 4, !dbg !143
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call5 = call i64 @wcslen(i32* noundef %arraydecay4), !dbg !145
  store i64 %call5, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !150
  %5 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp6 = icmp ult i64 %4, %5, !dbg !153
  br i1 %cmp6, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !155
  %7 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !155
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !155
  %9 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !159
  store i32 %8, i32* %arrayidx8, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %10, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx9, align 4, !dbg !167
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  call void @printWLine(i32* noundef %arraydecay10), !dbg !169
  %11 = load i32*, i32** %data, align 8, !dbg !170
  %12 = bitcast i32* %11 to i8*, !dbg !170
  call void @free(i8* noundef %12), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_18_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 27, column: 5, scope: !18)
!27 = !DILabel(scope: !18, name: "source", file: !19, line: 28)
!28 = !DILocation(line: 28, column: 1, scope: !18)
!29 = !DILocation(line: 30, column: 23, scope: !18)
!30 = !DILocation(line: 30, column: 12, scope: !18)
!31 = !DILocation(line: 30, column: 10, scope: !18)
!32 = !DILocation(line: 31, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 9)
!34 = !DILocation(line: 31, column: 14, scope: !33)
!35 = !DILocation(line: 31, column: 9, scope: !18)
!36 = !DILocation(line: 31, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !19, line: 31, column: 23)
!38 = !DILocation(line: 32, column: 13, scope: !18)
!39 = !DILocation(line: 32, column: 5, scope: !18)
!40 = !DILocation(line: 33, column: 5, scope: !18)
!41 = !DILocation(line: 33, column: 16, scope: !18)
!42 = !DILocalVariable(name: "i", scope: !43, file: !19, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !47)
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 16, scope: !43)
!49 = !DILocalVariable(name: "destLen", scope: !43, file: !19, line: 35, type: !44)
!50 = !DILocation(line: 35, column: 19, scope: !43)
!51 = !DILocalVariable(name: "dest", scope: !43, file: !19, line: 36, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 36, column: 17, scope: !43)
!56 = !DILocation(line: 37, column: 17, scope: !43)
!57 = !DILocation(line: 37, column: 9, scope: !43)
!58 = !DILocation(line: 38, column: 9, scope: !43)
!59 = !DILocation(line: 38, column: 21, scope: !43)
!60 = !DILocation(line: 39, column: 26, scope: !43)
!61 = !DILocation(line: 39, column: 19, scope: !43)
!62 = !DILocation(line: 39, column: 17, scope: !43)
!63 = !DILocation(line: 42, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !43, file: !19, line: 42, column: 9)
!65 = !DILocation(line: 42, column: 14, scope: !64)
!66 = !DILocation(line: 42, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !19, line: 42, column: 9)
!68 = !DILocation(line: 42, column: 25, scope: !67)
!69 = !DILocation(line: 42, column: 23, scope: !67)
!70 = !DILocation(line: 42, column: 9, scope: !64)
!71 = !DILocation(line: 44, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !19, line: 43, column: 9)
!73 = !DILocation(line: 44, column: 28, scope: !72)
!74 = !DILocation(line: 44, column: 18, scope: !72)
!75 = !DILocation(line: 44, column: 13, scope: !72)
!76 = !DILocation(line: 44, column: 21, scope: !72)
!77 = !DILocation(line: 45, column: 9, scope: !72)
!78 = !DILocation(line: 42, column: 35, scope: !67)
!79 = !DILocation(line: 42, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 45, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 46, column: 9, scope: !43)
!84 = !DILocation(line: 46, column: 21, scope: !43)
!85 = !DILocation(line: 47, column: 20, scope: !43)
!86 = !DILocation(line: 47, column: 9, scope: !43)
!87 = !DILocation(line: 48, column: 14, scope: !43)
!88 = !DILocation(line: 48, column: 9, scope: !43)
!89 = !DILocation(line: 50, column: 1, scope: !18)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_18_good", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!91 = !DILocation(line: 88, column: 5, scope: !90)
!92 = !DILocation(line: 89, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 101, type: !94, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!94 = !DISubroutineType(types: !95)
!95 = !{!8, !8, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !19, line: 101, type: !8)
!100 = !DILocation(line: 101, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !19, line: 101, type: !96)
!102 = !DILocation(line: 101, column: 27, scope: !93)
!103 = !DILocation(line: 104, column: 22, scope: !93)
!104 = !DILocation(line: 104, column: 12, scope: !93)
!105 = !DILocation(line: 104, column: 5, scope: !93)
!106 = !DILocation(line: 106, column: 5, scope: !93)
!107 = !DILocation(line: 107, column: 5, scope: !93)
!108 = !DILocation(line: 108, column: 5, scope: !93)
!109 = !DILocation(line: 111, column: 5, scope: !93)
!110 = !DILocation(line: 112, column: 5, scope: !93)
!111 = !DILocation(line: 113, column: 5, scope: !93)
!112 = !DILocation(line: 115, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!114 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 59, type: !3)
!115 = !DILocation(line: 59, column: 15, scope: !113)
!116 = !DILocation(line: 60, column: 10, scope: !113)
!117 = !DILocation(line: 61, column: 5, scope: !113)
!118 = !DILabel(scope: !113, name: "source", file: !19, line: 62)
!119 = !DILocation(line: 62, column: 1, scope: !113)
!120 = !DILocation(line: 64, column: 23, scope: !113)
!121 = !DILocation(line: 64, column: 12, scope: !113)
!122 = !DILocation(line: 64, column: 10, scope: !113)
!123 = !DILocation(line: 65, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !113, file: !19, line: 65, column: 9)
!125 = !DILocation(line: 65, column: 14, scope: !124)
!126 = !DILocation(line: 65, column: 9, scope: !113)
!127 = !DILocation(line: 65, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !19, line: 65, column: 23)
!129 = !DILocation(line: 66, column: 13, scope: !113)
!130 = !DILocation(line: 66, column: 5, scope: !113)
!131 = !DILocation(line: 67, column: 5, scope: !113)
!132 = !DILocation(line: 67, column: 17, scope: !113)
!133 = !DILocalVariable(name: "i", scope: !134, file: !19, line: 69, type: !44)
!134 = distinct !DILexicalBlock(scope: !113, file: !19, line: 68, column: 5)
!135 = !DILocation(line: 69, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !19, line: 69, type: !44)
!137 = !DILocation(line: 69, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !19, line: 70, type: !52)
!139 = !DILocation(line: 70, column: 17, scope: !134)
!140 = !DILocation(line: 71, column: 17, scope: !134)
!141 = !DILocation(line: 71, column: 9, scope: !134)
!142 = !DILocation(line: 72, column: 9, scope: !134)
!143 = !DILocation(line: 72, column: 21, scope: !134)
!144 = !DILocation(line: 73, column: 26, scope: !134)
!145 = !DILocation(line: 73, column: 19, scope: !134)
!146 = !DILocation(line: 73, column: 17, scope: !134)
!147 = !DILocation(line: 76, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !134, file: !19, line: 76, column: 9)
!149 = !DILocation(line: 76, column: 14, scope: !148)
!150 = !DILocation(line: 76, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !19, line: 76, column: 9)
!152 = !DILocation(line: 76, column: 25, scope: !151)
!153 = !DILocation(line: 76, column: 23, scope: !151)
!154 = !DILocation(line: 76, column: 9, scope: !148)
!155 = !DILocation(line: 78, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !19, line: 77, column: 9)
!157 = !DILocation(line: 78, column: 28, scope: !156)
!158 = !DILocation(line: 78, column: 18, scope: !156)
!159 = !DILocation(line: 78, column: 13, scope: !156)
!160 = !DILocation(line: 78, column: 21, scope: !156)
!161 = !DILocation(line: 79, column: 9, scope: !156)
!162 = !DILocation(line: 76, column: 35, scope: !151)
!163 = !DILocation(line: 76, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !82}
!165 = !DILocation(line: 79, column: 9, scope: !148)
!166 = !DILocation(line: 80, column: 9, scope: !134)
!167 = !DILocation(line: 80, column: 21, scope: !134)
!168 = !DILocation(line: 81, column: 20, scope: !134)
!169 = !DILocation(line: 81, column: 9, scope: !134)
!170 = !DILocation(line: 82, column: 14, scope: !134)
!171 = !DILocation(line: 82, column: 9, scope: !134)
!172 = !DILocation(line: 84, column: 1, scope: !113)
