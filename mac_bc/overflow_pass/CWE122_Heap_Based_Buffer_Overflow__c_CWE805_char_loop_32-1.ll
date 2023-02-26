; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !30
  %1 = load i8*, i8** %0, align 8, !dbg !31
  store i8* %1, i8** %data1, align 8, !dbg !29
  %call = call i8* @malloc(i64 noundef 50) #6, !dbg !32
  store i8* %call, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !34
  %cmp = icmp eq i8* %2, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %4 = load i8*, i8** %data1, align 8, !dbg !42
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %4, i8** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %7 = load i8*, i8** %6, align 8, !dbg !49
  store i8* %7, i8** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !58, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx3, align 1, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !69
  %cmp4 = icmp ult i64 %8, 100, !dbg !71
  br i1 %cmp4, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %9, !dbg !75
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !75
  %11 = load i8*, i8** %data2, align 8, !dbg !76
  %12 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !76
  store i8 %10, i8* %arrayidx6, align 1, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %13, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data2, align 8, !dbg !85
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 99, !dbg !85
  store i8 0, i8* %arrayidx7, align 1, !dbg !86
  %15 = load i8*, i8** %data2, align 8, !dbg !87
  call void @printLine(i8* noundef %15), !dbg !88
  %16 = load i8*, i8** %data2, align 8, !dbg !89
  call void @free(i8* noundef %16), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare void @printLine(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_good() #0 !dbg !92 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !119
  store i8* null, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !121, metadata !DIExpression()), !dbg !123
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !124
  %1 = load i8*, i8** %0, align 8, !dbg !125
  store i8* %1, i8** %data1, align 8, !dbg !123
  %call = call i8* @malloc(i64 noundef 100) #6, !dbg !126
  store i8* %call, i8** %data1, align 8, !dbg !127
  %2 = load i8*, i8** %data1, align 8, !dbg !128
  %cmp = icmp eq i8* %2, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  %4 = load i8*, i8** %data1, align 8, !dbg !136
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !137
  store i8* %4, i8** %5, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !139, metadata !DIExpression()), !dbg !141
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !142
  %7 = load i8*, i8** %6, align 8, !dbg !143
  store i8* %7, i8** %data2, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !149
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !150
  store i8 0, i8* %arrayidx3, align 1, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !155
  %cmp4 = icmp ult i64 %8, 100, !dbg !157
  br i1 %cmp4, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %9, !dbg !161
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !161
  %11 = load i8*, i8** %data2, align 8, !dbg !162
  %12 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !162
  store i8 %10, i8* %arrayidx6, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %13, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data2, align 8, !dbg !170
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 99, !dbg !170
  store i8 0, i8* %arrayidx7, align 1, !dbg !171
  %15 = load i8*, i8** %data2, align 8, !dbg !172
  call void @printLine(i8* noundef %15), !dbg !173
  %16 = load i8*, i8** %data2, align 8, !dbg !174
  call void @free(i8* noundef %16), !dbg !175
  ret void, !dbg !176
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
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 26, column: 13, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 13, scope: !14)
!26 = !DILocation(line: 28, column: 10, scope: !14)
!27 = !DILocalVariable(name: "data", scope: !28, file: !15, line: 30, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 24, scope: !28)
!31 = !DILocation(line: 30, column: 23, scope: !28)
!32 = !DILocation(line: 32, column: 24, scope: !28)
!33 = !DILocation(line: 32, column: 14, scope: !28)
!34 = !DILocation(line: 33, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !15, line: 33, column: 13)
!36 = !DILocation(line: 33, column: 18, scope: !35)
!37 = !DILocation(line: 33, column: 13, scope: !28)
!38 = !DILocation(line: 33, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 33, column: 27)
!40 = !DILocation(line: 34, column: 9, scope: !28)
!41 = !DILocation(line: 34, column: 17, scope: !28)
!42 = !DILocation(line: 35, column: 21, scope: !28)
!43 = !DILocation(line: 35, column: 10, scope: !28)
!44 = !DILocation(line: 35, column: 19, scope: !28)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !3)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "i", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 31, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !55, line: 94, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 40, column: 20, scope: !51)
!58 = !DILocalVariable(name: "source", scope: !51, file: !15, line: 41, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 100)
!62 = !DILocation(line: 41, column: 18, scope: !51)
!63 = !DILocation(line: 42, column: 13, scope: !51)
!64 = !DILocation(line: 43, column: 13, scope: !51)
!65 = !DILocation(line: 43, column: 27, scope: !51)
!66 = !DILocation(line: 45, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !51, file: !15, line: 45, column: 13)
!68 = !DILocation(line: 45, column: 18, scope: !67)
!69 = !DILocation(line: 45, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !15, line: 45, column: 13)
!71 = !DILocation(line: 45, column: 27, scope: !70)
!72 = !DILocation(line: 45, column: 13, scope: !67)
!73 = !DILocation(line: 47, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !15, line: 46, column: 13)
!75 = !DILocation(line: 47, column: 27, scope: !74)
!76 = !DILocation(line: 47, column: 17, scope: !74)
!77 = !DILocation(line: 47, column: 22, scope: !74)
!78 = !DILocation(line: 47, column: 25, scope: !74)
!79 = !DILocation(line: 48, column: 13, scope: !74)
!80 = !DILocation(line: 45, column: 35, scope: !70)
!81 = !DILocation(line: 45, column: 13, scope: !70)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 48, column: 13, scope: !67)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 49, column: 13, scope: !51)
!86 = !DILocation(line: 49, column: 25, scope: !51)
!87 = !DILocation(line: 50, column: 23, scope: !51)
!88 = !DILocation(line: 50, column: 13, scope: !51)
!89 = !DILocation(line: 51, column: 18, scope: !51)
!90 = !DILocation(line: 51, column: 13, scope: !51)
!91 = !DILocation(line: 54, column: 1, scope: !14)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!93 = !DILocation(line: 96, column: 5, scope: !92)
!94 = !DILocation(line: 97, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 108, type: !96, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DISubroutineType(types: !97)
!97 = !{!98, !98, !22}
!98 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !15, line: 108, type: !98)
!100 = !DILocation(line: 108, column: 14, scope: !95)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !15, line: 108, type: !22)
!102 = !DILocation(line: 108, column: 27, scope: !95)
!103 = !DILocation(line: 111, column: 22, scope: !95)
!104 = !DILocation(line: 111, column: 12, scope: !95)
!105 = !DILocation(line: 111, column: 5, scope: !95)
!106 = !DILocation(line: 113, column: 5, scope: !95)
!107 = !DILocation(line: 114, column: 5, scope: !95)
!108 = !DILocation(line: 115, column: 5, scope: !95)
!109 = !DILocation(line: 118, column: 5, scope: !95)
!110 = !DILocation(line: 119, column: 5, scope: !95)
!111 = !DILocation(line: 120, column: 5, scope: !95)
!112 = !DILocation(line: 122, column: 5, scope: !95)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!114 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 63, type: !3)
!115 = !DILocation(line: 63, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataPtr1", scope: !113, file: !15, line: 64, type: !22)
!117 = !DILocation(line: 64, column: 13, scope: !113)
!118 = !DILocalVariable(name: "dataPtr2", scope: !113, file: !15, line: 65, type: !22)
!119 = !DILocation(line: 65, column: 13, scope: !113)
!120 = !DILocation(line: 66, column: 10, scope: !113)
!121 = !DILocalVariable(name: "data", scope: !122, file: !15, line: 68, type: !3)
!122 = distinct !DILexicalBlock(scope: !113, file: !15, line: 67, column: 5)
!123 = !DILocation(line: 68, column: 16, scope: !122)
!124 = !DILocation(line: 68, column: 24, scope: !122)
!125 = !DILocation(line: 68, column: 23, scope: !122)
!126 = !DILocation(line: 70, column: 24, scope: !122)
!127 = !DILocation(line: 70, column: 14, scope: !122)
!128 = !DILocation(line: 71, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !15, line: 71, column: 13)
!130 = !DILocation(line: 71, column: 18, scope: !129)
!131 = !DILocation(line: 71, column: 13, scope: !122)
!132 = !DILocation(line: 71, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 71, column: 27)
!134 = !DILocation(line: 72, column: 9, scope: !122)
!135 = !DILocation(line: 72, column: 17, scope: !122)
!136 = !DILocation(line: 73, column: 21, scope: !122)
!137 = !DILocation(line: 73, column: 10, scope: !122)
!138 = !DILocation(line: 73, column: 19, scope: !122)
!139 = !DILocalVariable(name: "data", scope: !140, file: !15, line: 76, type: !3)
!140 = distinct !DILexicalBlock(scope: !113, file: !15, line: 75, column: 5)
!141 = !DILocation(line: 76, column: 16, scope: !140)
!142 = !DILocation(line: 76, column: 24, scope: !140)
!143 = !DILocation(line: 76, column: 23, scope: !140)
!144 = !DILocalVariable(name: "i", scope: !145, file: !15, line: 78, type: !52)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 77, column: 9)
!146 = !DILocation(line: 78, column: 20, scope: !145)
!147 = !DILocalVariable(name: "source", scope: !145, file: !15, line: 79, type: !59)
!148 = !DILocation(line: 79, column: 18, scope: !145)
!149 = !DILocation(line: 80, column: 13, scope: !145)
!150 = !DILocation(line: 81, column: 13, scope: !145)
!151 = !DILocation(line: 81, column: 27, scope: !145)
!152 = !DILocation(line: 83, column: 20, scope: !153)
!153 = distinct !DILexicalBlock(scope: !145, file: !15, line: 83, column: 13)
!154 = !DILocation(line: 83, column: 18, scope: !153)
!155 = !DILocation(line: 83, column: 25, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !15, line: 83, column: 13)
!157 = !DILocation(line: 83, column: 27, scope: !156)
!158 = !DILocation(line: 83, column: 13, scope: !153)
!159 = !DILocation(line: 85, column: 34, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !15, line: 84, column: 13)
!161 = !DILocation(line: 85, column: 27, scope: !160)
!162 = !DILocation(line: 85, column: 17, scope: !160)
!163 = !DILocation(line: 85, column: 22, scope: !160)
!164 = !DILocation(line: 85, column: 25, scope: !160)
!165 = !DILocation(line: 86, column: 13, scope: !160)
!166 = !DILocation(line: 83, column: 35, scope: !156)
!167 = !DILocation(line: 83, column: 13, scope: !156)
!168 = distinct !{!168, !158, !169, !84}
!169 = !DILocation(line: 86, column: 13, scope: !153)
!170 = !DILocation(line: 87, column: 13, scope: !145)
!171 = !DILocation(line: 87, column: 25, scope: !145)
!172 = !DILocation(line: 88, column: 23, scope: !145)
!173 = !DILocation(line: 88, column: 13, scope: !145)
!174 = !DILocation(line: 89, column: 18, scope: !145)
!175 = !DILocation(line: 89, column: 13, scope: !145)
!176 = !DILocation(line: 92, column: 1, scope: !113)
