; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [5 x i8] c"1234\00", align 1
@stdin = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @checkPassword() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %realPassword = alloca i8*, align 8
  %givenPassword = alloca [10 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %realPassword, metadata !14, metadata !DIExpression()), !dbg !17
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8** %realPassword, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata [10 x i8]* %givenPassword, metadata !18, metadata !DIExpression()), !dbg !22
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %givenPassword, i64 0, i64 0, !dbg !23
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !24
  %call = call i8* @fgets(i8* %arraydecay, i32 12, %struct._IO_FILE* %0), !dbg !25
  %arraydecay1 = getelementptr inbounds [10 x i8], [10 x i8]* %givenPassword, i64 0, i64 0, !dbg !26
  %1 = load i8*, i8** %realPassword, align 8, !dbg !28
  %call2 = call i32 @strncmp(i8* %arraydecay1, i8* %1, i64 4) #4, !dbg !29
  %tobool = icmp ne i32 %call2, 0, !dbg !29
  br i1 %tobool, label %if.end, label %if.then, !dbg !30

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !33
  br label %return, !dbg !33

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !34
  ret i32 %2, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strncmp(i8*, i8*, i64) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !35 {
entry:
  %call = call i32 @checkPassword(), !dbg !36
  ret i32 0, !dbg !37
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "checkPassword", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Fgets_Overrun_ArrayIndex_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "realPassword", scope: !9, file: !10, line: 8, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocation(line: 8, column: 11, scope: !9)
!18 = !DILocalVariable(name: "givenPassword", scope: !9, file: !10, line: 9, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 9, column: 7, scope: !9)
!23 = !DILocation(line: 10, column: 8, scope: !9)
!24 = !DILocation(line: 10, column: 27, scope: !9)
!25 = !DILocation(line: 10, column: 2, scope: !9)
!26 = !DILocation(line: 11, column: 18, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 9)
!28 = !DILocation(line: 11, column: 33, scope: !27)
!29 = !DILocation(line: 11, column: 10, scope: !27)
!30 = !DILocation(line: 11, column: 9, scope: !9)
!31 = !DILocation(line: 12, column: 3, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !10, line: 11, column: 51)
!33 = !DILocation(line: 14, column: 2, scope: !9)
!34 = !DILocation(line: 15, column: 1, scope: !9)
!35 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !11, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 18, column: 5, scope: !35)
!37 = !DILocation(line: 19, column: 1, scope: !35)
