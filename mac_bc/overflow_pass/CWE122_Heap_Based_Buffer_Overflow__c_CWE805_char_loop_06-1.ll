; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #6, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx1, align 1, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp2 = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp2, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !59
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !59
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !60
  store i8 %4, i8* %arrayidx4, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %7, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !69
  store i8 0, i8* %arrayidx5, align 1, !dbg !70
  %9 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* noundef %9), !dbg !72
  %10 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* noundef %10), !dbg !74
  ret void, !dbg !75
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %call = call i8* @malloc(i64 noundef 100) #6, !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %cmp = icmp eq i8* %0, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx1, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !126
  %cmp2 = icmp ult i64 %2, 100, !dbg !128
  br i1 %cmp2, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !132
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !132
  %5 = load i8*, i8** %data, align 8, !dbg !133
  %6 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !133
  store i8 %4, i8* %arrayidx4, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %7, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !141
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %9 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* noundef %9), !dbg !144
  %10 = load i8*, i8** %data, align 8, !dbg !145
  call void @free(i8* noundef %10), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i8* null, i8** %data, align 8, !dbg !151
  %call = call i8* @malloc(i64 noundef 100) #6, !dbg !152
  store i8* %call, i8** %data, align 8, !dbg !155
  %0 = load i8*, i8** %data, align 8, !dbg !156
  %cmp = icmp eq i8* %0, null, !dbg !158
  br i1 %cmp, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !160
  unreachable, !dbg !160

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !162
  store i8 0, i8* %arrayidx, align 1, !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !169
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx1, align 1, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !175
  %cmp2 = icmp ult i64 %2, 100, !dbg !177
  br i1 %cmp2, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !181
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !181
  %5 = load i8*, i8** %data, align 8, !dbg !182
  %6 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !182
  store i8 %4, i8* %arrayidx4, align 1, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %7, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !190
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !190
  store i8 0, i8* %arrayidx5, align 1, !dbg !191
  %9 = load i8*, i8** %data, align 8, !dbg !192
  call void @printLine(i8* noundef %9), !dbg !193
  %10 = load i8*, i8** %data, align 8, !dbg !194
  call void @free(i8* noundef %10), !dbg !195
  ret void, !dbg !196
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !3)
!20 = !DILocation(line: 29, column: 12, scope: !14)
!21 = !DILocation(line: 30, column: 10, scope: !14)
!22 = !DILocation(line: 34, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 8)
!25 = !DILocation(line: 34, column: 14, scope: !23)
!26 = !DILocation(line: 35, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 13)
!28 = !DILocation(line: 35, column: 18, scope: !27)
!29 = !DILocation(line: 35, column: 13, scope: !23)
!30 = !DILocation(line: 35, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 35, column: 27)
!32 = !DILocation(line: 36, column: 9, scope: !23)
!33 = !DILocation(line: 36, column: 17, scope: !23)
!34 = !DILocalVariable(name: "i", scope: !35, file: !15, line: 39, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 31, baseType: !38)
!37 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !39, line: 94, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!40 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 39, column: 16, scope: !35)
!42 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 40, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 40, column: 14, scope: !35)
!47 = !DILocation(line: 41, column: 9, scope: !35)
!48 = !DILocation(line: 42, column: 9, scope: !35)
!49 = !DILocation(line: 42, column: 23, scope: !35)
!50 = !DILocation(line: 44, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !35, file: !15, line: 44, column: 9)
!52 = !DILocation(line: 44, column: 14, scope: !51)
!53 = !DILocation(line: 44, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 9)
!55 = !DILocation(line: 44, column: 23, scope: !54)
!56 = !DILocation(line: 44, column: 9, scope: !51)
!57 = !DILocation(line: 46, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 45, column: 9)
!59 = !DILocation(line: 46, column: 23, scope: !58)
!60 = !DILocation(line: 46, column: 13, scope: !58)
!61 = !DILocation(line: 46, column: 18, scope: !58)
!62 = !DILocation(line: 46, column: 21, scope: !58)
!63 = !DILocation(line: 47, column: 9, scope: !58)
!64 = !DILocation(line: 44, column: 31, scope: !54)
!65 = !DILocation(line: 44, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 47, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 48, column: 9, scope: !35)
!70 = !DILocation(line: 48, column: 21, scope: !35)
!71 = !DILocation(line: 49, column: 19, scope: !35)
!72 = !DILocation(line: 49, column: 9, scope: !35)
!73 = !DILocation(line: 50, column: 14, scope: !35)
!74 = !DILocation(line: 50, column: 9, scope: !35)
!75 = !DILocation(line: 52, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_06_good", scope: !15, file: !15, line: 119, type: !16, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!77 = !DILocation(line: 121, column: 5, scope: !76)
!78 = !DILocation(line: 122, column: 5, scope: !76)
!79 = !DILocation(line: 123, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 135, type: !81, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 135, type: !83)
!86 = !DILocation(line: 135, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 135, type: !84)
!88 = !DILocation(line: 135, column: 27, scope: !80)
!89 = !DILocation(line: 138, column: 22, scope: !80)
!90 = !DILocation(line: 138, column: 12, scope: !80)
!91 = !DILocation(line: 138, column: 5, scope: !80)
!92 = !DILocation(line: 140, column: 5, scope: !80)
!93 = !DILocation(line: 141, column: 5, scope: !80)
!94 = !DILocation(line: 142, column: 5, scope: !80)
!95 = !DILocation(line: 145, column: 5, scope: !80)
!96 = !DILocation(line: 146, column: 5, scope: !80)
!97 = !DILocation(line: 147, column: 5, scope: !80)
!98 = !DILocation(line: 149, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 61, type: !3)
!101 = !DILocation(line: 61, column: 12, scope: !99)
!102 = !DILocation(line: 62, column: 10, scope: !99)
!103 = !DILocation(line: 71, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !15, line: 69, column: 5)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 63, column: 8)
!106 = !DILocation(line: 71, column: 14, scope: !104)
!107 = !DILocation(line: 72, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 72, column: 13)
!109 = !DILocation(line: 72, column: 18, scope: !108)
!110 = !DILocation(line: 72, column: 13, scope: !104)
!111 = !DILocation(line: 72, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 72, column: 27)
!113 = !DILocation(line: 73, column: 9, scope: !104)
!114 = !DILocation(line: 73, column: 17, scope: !104)
!115 = !DILocalVariable(name: "i", scope: !116, file: !15, line: 76, type: !36)
!116 = distinct !DILexicalBlock(scope: !99, file: !15, line: 75, column: 5)
!117 = !DILocation(line: 76, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !15, line: 77, type: !43)
!119 = !DILocation(line: 77, column: 14, scope: !116)
!120 = !DILocation(line: 78, column: 9, scope: !116)
!121 = !DILocation(line: 79, column: 9, scope: !116)
!122 = !DILocation(line: 79, column: 23, scope: !116)
!123 = !DILocation(line: 81, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !15, line: 81, column: 9)
!125 = !DILocation(line: 81, column: 14, scope: !124)
!126 = !DILocation(line: 81, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 81, column: 9)
!128 = !DILocation(line: 81, column: 23, scope: !127)
!129 = !DILocation(line: 81, column: 9, scope: !124)
!130 = !DILocation(line: 83, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 82, column: 9)
!132 = !DILocation(line: 83, column: 23, scope: !131)
!133 = !DILocation(line: 83, column: 13, scope: !131)
!134 = !DILocation(line: 83, column: 18, scope: !131)
!135 = !DILocation(line: 83, column: 21, scope: !131)
!136 = !DILocation(line: 84, column: 9, scope: !131)
!137 = !DILocation(line: 81, column: 31, scope: !127)
!138 = !DILocation(line: 81, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 84, column: 9, scope: !124)
!141 = !DILocation(line: 85, column: 9, scope: !116)
!142 = !DILocation(line: 85, column: 21, scope: !116)
!143 = !DILocation(line: 86, column: 19, scope: !116)
!144 = !DILocation(line: 86, column: 9, scope: !116)
!145 = !DILocation(line: 87, column: 14, scope: !116)
!146 = !DILocation(line: 87, column: 9, scope: !116)
!147 = !DILocation(line: 89, column: 1, scope: !99)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!149 = !DILocalVariable(name: "data", scope: !148, file: !15, line: 94, type: !3)
!150 = !DILocation(line: 94, column: 12, scope: !148)
!151 = !DILocation(line: 95, column: 10, scope: !148)
!152 = !DILocation(line: 99, column: 24, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !15, line: 97, column: 5)
!154 = distinct !DILexicalBlock(scope: !148, file: !15, line: 96, column: 8)
!155 = !DILocation(line: 99, column: 14, scope: !153)
!156 = !DILocation(line: 100, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 100, column: 13)
!158 = !DILocation(line: 100, column: 18, scope: !157)
!159 = !DILocation(line: 100, column: 13, scope: !153)
!160 = !DILocation(line: 100, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 100, column: 27)
!162 = !DILocation(line: 101, column: 9, scope: !153)
!163 = !DILocation(line: 101, column: 17, scope: !153)
!164 = !DILocalVariable(name: "i", scope: !165, file: !15, line: 104, type: !36)
!165 = distinct !DILexicalBlock(scope: !148, file: !15, line: 103, column: 5)
!166 = !DILocation(line: 104, column: 16, scope: !165)
!167 = !DILocalVariable(name: "source", scope: !165, file: !15, line: 105, type: !43)
!168 = !DILocation(line: 105, column: 14, scope: !165)
!169 = !DILocation(line: 106, column: 9, scope: !165)
!170 = !DILocation(line: 107, column: 9, scope: !165)
!171 = !DILocation(line: 107, column: 23, scope: !165)
!172 = !DILocation(line: 109, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !165, file: !15, line: 109, column: 9)
!174 = !DILocation(line: 109, column: 14, scope: !173)
!175 = !DILocation(line: 109, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !15, line: 109, column: 9)
!177 = !DILocation(line: 109, column: 23, scope: !176)
!178 = !DILocation(line: 109, column: 9, scope: !173)
!179 = !DILocation(line: 111, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !15, line: 110, column: 9)
!181 = !DILocation(line: 111, column: 23, scope: !180)
!182 = !DILocation(line: 111, column: 13, scope: !180)
!183 = !DILocation(line: 111, column: 18, scope: !180)
!184 = !DILocation(line: 111, column: 21, scope: !180)
!185 = !DILocation(line: 112, column: 9, scope: !180)
!186 = !DILocation(line: 109, column: 31, scope: !176)
!187 = !DILocation(line: 109, column: 9, scope: !176)
!188 = distinct !{!188, !178, !189, !68}
!189 = !DILocation(line: 112, column: 9, scope: !173)
!190 = !DILocation(line: 113, column: 9, scope: !165)
!191 = !DILocation(line: 113, column: 21, scope: !165)
!192 = !DILocation(line: 114, column: 19, scope: !165)
!193 = !DILocation(line: 114, column: 9, scope: !165)
!194 = !DILocation(line: 115, column: 14, scope: !165)
!195 = !DILocation(line: 115, column: 9, scope: !165)
!196 = !DILocation(line: 117, column: 1, scope: !148)
