; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @badSource(i32* noundef %2), !dbg !35
  store i32* %call1, i32** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %4 = load i32*, i32** %data, align 8, !dbg !51
  %call2 = call i64 @wcslen(i32* noundef %4), !dbg !52
  store i64 %call2, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !57
  %6 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp3 = icmp ult i64 %5, %6, !dbg !60
  br i1 %cmp3, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !62
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !62
  %9 = load i32, i32* %arrayidx, align 4, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !66
  store i32 %9, i32* %arrayidx4, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %11, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !74
  store i32 0, i32* %arrayidx5, align 4, !dbg !75
  %12 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* noundef %12), !dbg !77
  %13 = load i32*, i32** %data, align 8, !dbg !78
  %14 = bitcast i32* %13 to i8*, !dbg !78
  call void @free(i8* noundef %14), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @badSource(i32* noundef %data) #0 !dbg !81 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = load i32*, i32** %data.addr, align 8, !dbg !86
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !87
  %1 = load i32*, i32** %data.addr, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %2 = load i32*, i32** %data.addr, align 8, !dbg !90
  ret i32* %2, !dbg !91
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i64 @wcslen(i32* noundef) #5

declare void @printWLine(i32* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* noundef null), !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 noundef %conv), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_good(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_bad(), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !118
  %0 = bitcast i8* %call to i32*, !dbg !119
  store i32* %0, i32** %data, align 8, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %cmp = icmp eq i32* %1, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %call1 = call i32* @goodG2BSource(i32* noundef %2), !dbg !128
  store i32* %call1, i32** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !130, metadata !DIExpression()), !dbg !132
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !135, metadata !DIExpression()), !dbg !136
  %4 = load i32*, i32** %data, align 8, !dbg !137
  %call2 = call i64 @wcslen(i32* noundef %4), !dbg !138
  store i64 %call2, i64* %dataLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !143
  %6 = load i64, i64* %dataLen, align 8, !dbg !145
  %cmp3 = icmp ult i64 %5, %6, !dbg !146
  br i1 %cmp3, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %8 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !148
  %9 = load i32, i32* %arrayidx, align 4, !dbg !148
  %10 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !152
  store i32 %9, i32* %arrayidx4, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %11, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !159
  store i32 0, i32* %arrayidx5, align 4, !dbg !160
  %12 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* noundef %12), !dbg !162
  %13 = load i32*, i32** %data, align 8, !dbg !163
  %14 = bitcast i32* %13 to i8*, !dbg !163
  call void @free(i8* noundef %14), !dbg !164
  ret void, !dbg !165
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2BSource(i32* noundef %data) #0 !dbg !166 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !167, metadata !DIExpression()), !dbg !168
  %0 = load i32*, i32** %data.addr, align 8, !dbg !169
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !170
  %1 = load i32*, i32** %data.addr, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  %2 = load i32*, i32** %data.addr, align 8, !dbg !173
  ret i32* %2, !dbg !174
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_bad", scope: !19, file: !19, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 33, type: !3)
!24 = !DILocation(line: 33, column: 15, scope: !18)
!25 = !DILocation(line: 34, column: 23, scope: !18)
!26 = !DILocation(line: 34, column: 12, scope: !18)
!27 = !DILocation(line: 34, column: 10, scope: !18)
!28 = !DILocation(line: 35, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 9)
!30 = !DILocation(line: 35, column: 14, scope: !29)
!31 = !DILocation(line: 35, column: 9, scope: !18)
!32 = !DILocation(line: 35, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 35, column: 23)
!34 = !DILocation(line: 36, column: 22, scope: !18)
!35 = !DILocation(line: 36, column: 12, scope: !18)
!36 = !DILocation(line: 36, column: 10, scope: !18)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !19, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 38, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !19, line: 39, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !47)
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 39, column: 16, scope: !38)
!49 = !DILocalVariable(name: "dataLen", scope: !38, file: !19, line: 39, type: !44)
!50 = !DILocation(line: 39, column: 19, scope: !38)
!51 = !DILocation(line: 40, column: 26, scope: !38)
!52 = !DILocation(line: 40, column: 19, scope: !38)
!53 = !DILocation(line: 40, column: 17, scope: !38)
!54 = !DILocation(line: 42, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !38, file: !19, line: 42, column: 9)
!56 = !DILocation(line: 42, column: 14, scope: !55)
!57 = !DILocation(line: 42, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !19, line: 42, column: 9)
!59 = !DILocation(line: 42, column: 25, scope: !58)
!60 = !DILocation(line: 42, column: 23, scope: !58)
!61 = !DILocation(line: 42, column: 9, scope: !55)
!62 = !DILocation(line: 44, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !19, line: 43, column: 9)
!64 = !DILocation(line: 44, column: 28, scope: !63)
!65 = !DILocation(line: 44, column: 18, scope: !63)
!66 = !DILocation(line: 44, column: 13, scope: !63)
!67 = !DILocation(line: 44, column: 21, scope: !63)
!68 = !DILocation(line: 45, column: 9, scope: !63)
!69 = !DILocation(line: 42, column: 35, scope: !58)
!70 = !DILocation(line: 42, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 45, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 46, column: 9, scope: !38)
!75 = !DILocation(line: 46, column: 20, scope: !38)
!76 = !DILocation(line: 47, column: 20, scope: !38)
!77 = !DILocation(line: 47, column: 9, scope: !38)
!78 = !DILocation(line: 48, column: 14, scope: !38)
!79 = !DILocation(line: 48, column: 9, scope: !38)
!80 = !DILocation(line: 50, column: 1, scope: !18)
!81 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 23, type: !82, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DISubroutineType(types: !83)
!83 = !{!3, !3}
!84 = !DILocalVariable(name: "data", arg: 1, scope: !81, file: !19, line: 23, type: !3)
!85 = !DILocation(line: 23, column: 38, scope: !81)
!86 = !DILocation(line: 26, column: 13, scope: !81)
!87 = !DILocation(line: 26, column: 5, scope: !81)
!88 = !DILocation(line: 27, column: 5, scope: !81)
!89 = !DILocation(line: 27, column: 17, scope: !81)
!90 = !DILocation(line: 28, column: 12, scope: !81)
!91 = !DILocation(line: 28, column: 5, scope: !81)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_42_good", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!93 = !DILocation(line: 88, column: 5, scope: !92)
!94 = !DILocation(line: 89, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 101, type: !96, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!96 = !DISubroutineType(types: !97)
!97 = !{!8, !8, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !19, line: 101, type: !8)
!102 = !DILocation(line: 101, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !19, line: 101, type: !98)
!104 = !DILocation(line: 101, column: 27, scope: !95)
!105 = !DILocation(line: 104, column: 22, scope: !95)
!106 = !DILocation(line: 104, column: 12, scope: !95)
!107 = !DILocation(line: 104, column: 5, scope: !95)
!108 = !DILocation(line: 106, column: 5, scope: !95)
!109 = !DILocation(line: 107, column: 5, scope: !95)
!110 = !DILocation(line: 108, column: 5, scope: !95)
!111 = !DILocation(line: 111, column: 5, scope: !95)
!112 = !DILocation(line: 112, column: 5, scope: !95)
!113 = !DILocation(line: 113, column: 5, scope: !95)
!114 = !DILocation(line: 115, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 65, type: !20, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!116 = !DILocalVariable(name: "data", scope: !115, file: !19, line: 67, type: !3)
!117 = !DILocation(line: 67, column: 15, scope: !115)
!118 = !DILocation(line: 68, column: 23, scope: !115)
!119 = !DILocation(line: 68, column: 12, scope: !115)
!120 = !DILocation(line: 68, column: 10, scope: !115)
!121 = !DILocation(line: 69, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !19, line: 69, column: 9)
!123 = !DILocation(line: 69, column: 14, scope: !122)
!124 = !DILocation(line: 69, column: 9, scope: !115)
!125 = !DILocation(line: 69, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !19, line: 69, column: 23)
!127 = !DILocation(line: 70, column: 26, scope: !115)
!128 = !DILocation(line: 70, column: 12, scope: !115)
!129 = !DILocation(line: 70, column: 10, scope: !115)
!130 = !DILocalVariable(name: "dest", scope: !131, file: !19, line: 72, type: !39)
!131 = distinct !DILexicalBlock(scope: !115, file: !19, line: 71, column: 5)
!132 = !DILocation(line: 72, column: 17, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !19, line: 73, type: !44)
!134 = !DILocation(line: 73, column: 16, scope: !131)
!135 = !DILocalVariable(name: "dataLen", scope: !131, file: !19, line: 73, type: !44)
!136 = !DILocation(line: 73, column: 19, scope: !131)
!137 = !DILocation(line: 74, column: 26, scope: !131)
!138 = !DILocation(line: 74, column: 19, scope: !131)
!139 = !DILocation(line: 74, column: 17, scope: !131)
!140 = !DILocation(line: 76, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !19, line: 76, column: 9)
!142 = !DILocation(line: 76, column: 14, scope: !141)
!143 = !DILocation(line: 76, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !19, line: 76, column: 9)
!145 = !DILocation(line: 76, column: 25, scope: !144)
!146 = !DILocation(line: 76, column: 23, scope: !144)
!147 = !DILocation(line: 76, column: 9, scope: !141)
!148 = !DILocation(line: 78, column: 23, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !19, line: 77, column: 9)
!150 = !DILocation(line: 78, column: 28, scope: !149)
!151 = !DILocation(line: 78, column: 18, scope: !149)
!152 = !DILocation(line: 78, column: 13, scope: !149)
!153 = !DILocation(line: 78, column: 21, scope: !149)
!154 = !DILocation(line: 79, column: 9, scope: !149)
!155 = !DILocation(line: 76, column: 35, scope: !144)
!156 = !DILocation(line: 76, column: 9, scope: !144)
!157 = distinct !{!157, !147, !158, !73}
!158 = !DILocation(line: 79, column: 9, scope: !141)
!159 = !DILocation(line: 80, column: 9, scope: !131)
!160 = !DILocation(line: 80, column: 20, scope: !131)
!161 = !DILocation(line: 81, column: 20, scope: !131)
!162 = !DILocation(line: 81, column: 9, scope: !131)
!163 = !DILocation(line: 82, column: 14, scope: !131)
!164 = !DILocation(line: 82, column: 9, scope: !131)
!165 = !DILocation(line: 84, column: 1, scope: !115)
!166 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 56, type: !82, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!167 = !DILocalVariable(name: "data", arg: 1, scope: !166, file: !19, line: 56, type: !3)
!168 = !DILocation(line: 56, column: 42, scope: !166)
!169 = !DILocation(line: 59, column: 13, scope: !166)
!170 = !DILocation(line: 59, column: 5, scope: !166)
!171 = !DILocation(line: 60, column: 5, scope: !166)
!172 = !DILocation(line: 60, column: 16, scope: !166)
!173 = !DILocation(line: 61, column: 12, scope: !166)
!174 = !DILocation(line: 61, column: 5, scope: !166)
